import 'dart:convert';
import 'package:koohpayeh/premission/superAdmin.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'model/LoginResponseModel.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

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


  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      scaffoldMessengerKey: _messengerKey,
      home: Builder(
        builder: (context) {
          return Scaffold(
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SafeArea(
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
                      child: Text('Welcome To Koohpayeh!',
                          style: TextStyle(
                              fontSize: height * 0.029,
                              color: Theme.of(context).unselectedWidgetColor,
                              fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text('Login',
                          style: TextStyle(
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
                            decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person),
                              hintText: 'Username',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
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
                              hintText: 'Password',
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(15)),
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
          );
        }
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
        },
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20),

        ),
      ),
    );
  }

  void sendLoginRequest({required BuildContext context , required String username , required String password}) async{

    var body = Map<String , dynamic>();

    body["username"]=username;
    body["password"]=password;

    Response response = await post(Uri.parse('https://koohpayeh.co/api/loginimda') , body: body);

    if( response.statusCode == 200){

      // Result

      var loginJson = json.decode(utf8.decode(response.bodyBytes));
      var model = LoginResponseModel( loginJson["success"] , loginJson["message"],);

      if( model.success == true){

        //ShowMySnackBar(context, model.message);
        // navigate to login page


        print("password = " + model.message);

        Navigator.push(context, MaterialPageRoute(builder: (context)=> superAdmin() ));


      }else{

        ShowMySnackBar(context, model.message);


      }

    }else{

      ShowMySnackBar(context, "خطایی در ارتباط با سرور رخ داده است");


    }










  }



  void  ShowMySnackBar(BuildContext context , String message){

    _messengerKey.currentState!.showSnackBar(
        SnackBar(
          backgroundColor: Colors.black,
          content:Text(message , style: TextStyle(fontFamily: "Irs" , fontSize: 17 , color: Colors.white , fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
          elevation: 5,
          duration: Duration(seconds: 10),

          action: SnackBarAction(
            label: 'تایید',
            onPressed: (){},
            textColor: Colors.yellowAccent,

          ),


        )



    );







  }








}
