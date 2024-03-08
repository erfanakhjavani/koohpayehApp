import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:koohpayeh/splash_screen.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/login/login_response_model.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

late String username, password;

final _messengerKey = GlobalKey<ScaffoldMessengerState>();

class _LoginState extends State<Login> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  late bool isFirst;

  bool _isObscure = true;

  @override
  void initState() {
    username = "";
    password = "";
    isFirst = true;
    super.initState();
  }

  static TextStyle style_filed = TextStyle(
      fontFamily: 'Irs',
      fontSize: 16,
      color: Color.fromRGBO(73, 73, 73, 1.0),
      fontWeight: FontWeight.w200);


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return ScaffoldMessenger(
      key: _messengerKey,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Lottie.asset('assets/json/honey.json',
                      height: height * 0.30,
                      width: double.infinity,
                      fit: BoxFit.fitHeight),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text("به کوهپایه خوش آمدید",
                        style: TextStyle(
                            fontSize: height * 0.029,
                            fontFamily: "Irs",
                            color: Theme.of(context).unselectedWidgetColor,
                            fontWeight: FontWeight.bold)),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Text('ورود',
                        style: TextStyle(
                            fontFamily: 'Irs',
                            fontSize: height * 0.03,
                            color: Theme.of(context).unselectedWidgetColor)),
                  ),
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, right: 20),
                    child: Column(
                      children: [
                        TextFormField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.person),
                            hintText: 'نام کاربری',
                            hintStyle: style_filed,
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          controller: _usernameController,
                          validator: (value) {
                            return null;
                          },
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        TextFormField(
                          controller: _passwordController,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock_open),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isObscure
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                            ),
                            hintText: 'رمز عبور',
                            hintStyle: style_filed,
                            border: const OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15)),
                            ),
                          ),
                          validator: (value) {
                            return null;
                          },
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        loginBtn(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget loginBtn() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(62, 88, 20, 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        onPressed: () {
          if (_usernameController.text == "") {
            ShowMySnackBar(context, "لطفا نام کاربری را وارد کنید");
          } else if (_passwordController.text == "") {
            // error
            ShowMySnackBar(context, "لطفا رمز عبور را وارد کنید");
          }
          sendLoginRequest(
              context: context,
              username: _usernameController.text,
              password: _passwordController.text);
          setState(() {
            isFirst = false;
          });
        },
        child: AnimatedCrossFade(
          firstChild: Text(
            'ورود',
            style:
                TextStyle(fontSize: 20, color: Colors.white, fontFamily: "Irs"),
          ),
          secondChild: LoadingAnimationWidget.fourRotatingDots(
              color: Colors.white, size: 20),
          crossFadeState:
              isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
          duration: Duration(milliseconds: 100),
        ),
      ),
    );
  }

  Future<void> sendLoginRequest({
    required BuildContext context,
    required String username,
    required String password,
  }) async {
    try {
      final response = await post(
        Uri.parse('https://crm.koohpayeh.co/api/loginimda'),
        body: {'username': username, 'password': password},
      );

      if (response.statusCode == 200) {
        var loginJson = json.decode(utf8.decode(response.bodyBytes));
        var model = LoginResponseModel(
            success: loginJson["success"],
            message: loginJson["message"],
            data: User.fromJson(loginJson['data']),
            role: loginJson['role']);

        setState(() {
          isFirst = true;
        });

        if (model.success == true) {
          savedLogin(model.success);


          Get.off(Splash());

          print('Login successful!');
          print('User data:');
          print('ID: ${model.data.id}');
          print('Role: ${model.role}');
          print('Name: ${model.data.name}');
          print('Family: ${model.data.family}');
          print('Phone: ${model.data.phone}');
          print('Role ID: ${model.data.roleId}');
          print('Image: ${model.data.image}');
          print('City ID: ${model.data.cityId}');
          print('Created at: ${model.data.createdAt}');
          print('Updated at: ${model.data.updatedAt}');
          print('Token: ${model.data.token}');

          final prefs = await SharedPreferences.getInstance();

          await prefs.setString('token', model.data.token);
          await prefs.setString('role', model.role);
          await prefs.setString('image', model.data.image);
          await prefs.setString('nameuser', model.data.name);
          await prefs.setString('familyuser', model.data.family);
          await prefs.setString('familyUser', model.data.family);
          await prefs.setString('phoneUser', model.data.phone);
        } else {
          print(model.message);
          ShowMySnackBar(context, model.message);
        }
      } else {
        ShowMySnackBar(context, "لطفا اینترنت را بررسی کنید.");
      }
    } catch (e) {
      setState(() {
        isFirst = true;
      });
      ShowMySnackBar(context, "نام کاربری یا رمز عبور اشتباه است");
    }
  }

  Future<void> savedLogin(model) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setBool("LoggedIn", model);
  }

  void ShowMySnackBar(BuildContext context, String message) {
    _messengerKey.currentState!.showSnackBar(Get.snackbar(
      '',
      '',
      barBlur: 50,
      titleText: Text(
        ":خطا",
        style: TextStyle(
            fontFamily: "Irs",
            fontSize: 17,
            color: Colors.red,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      messageText: Text(
        message,
        style: TextStyle(
            fontFamily: "Irs",
            fontSize: 17,
            color: Colors.black87,
            fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
      duration: Duration(seconds: 3),
    ) as SnackBar);
  }
}
