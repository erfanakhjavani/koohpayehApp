import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/login.dart';
import 'package:koohpayeh/model/shared_pref.dart';
import 'package:koohpayeh/switch.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'features/presentions/area_supervisor/create_shop/seller_add.dart';


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

      duration: 2000,
      imageSize: 300,
      pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
      imageSrc: "assets/images/logo2.png",
      speed: 500,
      backgroundColor: Colors.transparent,
      navigateRoute: FutureBuilder<SharedPreferences>(
        future: SharedPreferences.getInstance(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            SharedPreferences sharedPreferences = snapshot.data!;
            var loggedInState = sharedPreferences.getBool("LoggedIn") ?? false;
            var logeedrole =  sharedPreferences.getString('role') ?? '';
            Get.find<shareData>().onInit();
            clearDataSeller();


            if(loggedInState){
              return //Login();
              navigateUserBasedOnRole(logeedrole, context);
            }else{
              return //superAdmin();
              Login();
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

