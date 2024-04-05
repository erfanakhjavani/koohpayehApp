import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/login.dart';
import 'package:koohpayeh/model/shared_pref.dart';
import 'package:koohpayeh/switch.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'features/presentions/area_supervisor/create_shop/seller_add.dart';


void main() {
  runApp(Splash());
}

class Splash extends StatelessWidget {


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
            var loginRole =  sharedPreferences.getString('role') ?? '';
            Get.find<shareData>().onInit();
            clearDataSeller();

            // برای بررسی اینکه آیا قبلا لاگین شده یا خیر
            if(loggedInState){
              return
              navigateUserBasedOnRole(loginRole, context);
            }else{
              return
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

