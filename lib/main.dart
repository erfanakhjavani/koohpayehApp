import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:koohpayeh/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  runApp(const Ksplash());

}


