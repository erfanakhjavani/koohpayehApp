import 'package:flutter/material.dart';
import 'package:koohpayeh/login.dart';
import 'package:koohpayeh/premission/superAdmin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

void main() {
  runApp(Splash() );
}


class Splash extends StatelessWidget {

  static const titleStyle =  TextStyle(
      color: Color.fromRGBO(62, 88, 20, 1.0),
      fontWeight: FontWeight.w800,
      fontFamily: 'Brl',
      fontSize: 30,
      letterSpacing: 0.5);



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: SplashScreenView(

      duration: 4500,
      imageSize: 300,
      pageRouteTransition: PageRouteTransition.Normal,
      imageSrc: "assets/images/fade.gif",
      speed: 200,
      text: "Natural Honey",
      textStyle: titleStyle,
      textType: TextType.TyperAnimatedText,
      backgroundColor: Colors.white,
      navigateRoute: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            SharedPreferences sharedPreferences = snapshot.data!;
            var loggedInState = sharedPreferences.getBool("LoggedIn") ?? false;

            if(loggedInState){
              return superAdmin();
            }else{
              return Login();
            }
          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ) ,
    )
    );


  }
}

