import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/permission/sales_expert.dart';
import 'package:koohpayeh/permission/super_admin.dart';
import 'package:koohpayeh/splash_screen.dart';
import 'features/bindings/my_bidings.dart';
import 'features/presentations/area_supervisor/create_shop/seller_add.dart';
import 'login.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  runApp(const Main());
}
  class Main extends StatelessWidget {
    const Main({super.key});

    @override
    Widget build(BuildContext context) {
      return  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: MyBindings(),
        getPages:[
          GetPage(name: '/super_admin', page: ()=> SuperAdmin()),
          GetPage(name: '/login', page: ()=> Login()),
          GetPage(name: '/seles_expert', page: ()=> SelesExpert()),
          GetPage(name: '/create_seller', page: ()=> createSeller()),
          GetPage(name: "/splash",page: ()=> Splash()),
        ],
        home: Splash(),


      );
    }
  }





