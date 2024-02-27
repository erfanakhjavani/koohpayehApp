import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/premission/sales_expert.dart';
import 'package:koohpayeh/premission/super_admin.dart';
import 'package:koohpayeh/splash_screen.dart';
import 'features/bindings/my_bidings.dart';
import 'features/presentions/area_supervisor/create_shop.dart';
import 'features/presentions/area_supervisor/seller_add.dart';
import 'features/presentions/area_supervisor/store_list.dart';
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
     //     GetPage(name: "/create_shop",page: ()=> CreateShop()),
          GetPage(name: "/store-list",page: ()=> Store_list()),
          GetPage(name: "/splash",page: ()=> Splash()),
        ],
        home: Splash(),


      );
    }
  }





