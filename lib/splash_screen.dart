import 'package:flutter/material.dart';
import 'package:koohpayeh/login.dart';

import 'package:splash_screen_view/SplashScreenView.dart';



class Ksplash extends StatelessWidget {
  const Ksplash({super.key});

  static const titleStyle =  TextStyle(
      color: Color.fromRGBO(62, 88, 20, 1.0),
      fontWeight: FontWeight.w800,
      fontFamily: 'Brl',
      fontSize: 30,
      letterSpacing: 0.5);

  @override
  Widget build(BuildContext context) {






    Widget example = SplashScreenView(
      navigateRoute: const Login(),
      duration: 4500,
      imageSize: 300,
      pageRouteTransition: PageRouteTransition.CupertinoPageRoute,
      imageSrc: "assets/images/fade.gif",
      speed: 200,
      text: "Natural Honey",
      textStyle: titleStyle,
      textType: TextType.TyperAnimatedText,
      backgroundColor: Colors.white,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: example,
    );
  }
}
