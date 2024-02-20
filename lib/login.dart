import 'dart:convert';
import 'package:get/get.dart';
import 'package:koohpayeh/premission/superAdmin.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/LoginResponseModel.dart';

class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}

late String username , password;

var _usernameController = TextEditingController();
var _passwordController = TextEditingController();

final _messengerKey = GlobalKey<ScaffoldMessengerState>();

class _LoginState extends State<Login> {


  bool _isObscure = true;

  @override
  void initState() {
    username = "";
    password = "";

    super.initState();
  }


  static TextStyle style_filed = TextStyle(
      fontFamily: 'Irs',
      fontSize: 16,
      color: Color.fromRGBO(73, 73, 73, 1.0),
      fontWeight: FontWeight.w200);
  static TextStyle style_button = TextStyle(
      fontFamily: 'Irs',
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w200);


  bool isFirst = true;


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery
        .of(context)
        .size
        .height;

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
                                    color: Theme
                                        .of(context)
                                        .unselectedWidgetColor,
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
                                    color: Theme
                                        .of(context)
                                        .unselectedWidgetColor)),
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                    ),
                                  ),
                                  controller: _usernameController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter username';
                                    } else if (value.length < 4) {
                                      return 'at least enter 4 characters';
                                    } else if (value.length > 13) {
                                      return 'maximum character is 13';
                                    }
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
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(15)),
                                    ),
                                  ),
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    } else if (value.length < 7) {
                                      return 'at least enter 6 characters';
                                    } else if (value.length > 13) {
                                      return 'maximum character is 13';
                                    }
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
            style: TextStyle(fontSize: 20, color: Colors.white,fontFamily: "Irs"),


          ),
          secondChild: LoadingAnimationWidget.fourRotatingDots(
              color: Colors.white, size: 20),
          crossFadeState: isFirst ? CrossFadeState.showFirst : CrossFadeState
              .showSecond,
          duration: Duration(milliseconds: 100),
        ),
      ),
    );
  }

  void sendLoginRequest(
      {required BuildContext context, required String username, required String password}) async {
    var body = Map<String, dynamic>();

    body["username"] = username;
    body["password"] = password;

    var response = await post(
        Uri.parse('https://crm.koohpayeh.co/api/loginimda'), body: body);

    if (response.statusCode == 200) {
      setState(() {
        isFirst = true;
      });

      // Result

      var loginJson = json.decode(utf8.decode(response.bodyBytes));
      var model = LoginResponseModel(
        loginJson["success"], loginJson["message"],);

      if (model.success == true) {
         savedLogin(model.success);


        print("password = " + model.message);

        Navigator.push(context, MaterialPageRoute(builder: (context)=> superAdmin()));

      } else {
        ShowMySnackBar(context, model.message);
      }
    } else {
      ShowMySnackBar(context, "خطایی در ارتباط با سرور رخ داده است");
    }
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






Future <void> savedLogin(model) async{
    final prefs = await SharedPreferences.getInstance();

    prefs.setBool("LoggedIn", model);
}
}
