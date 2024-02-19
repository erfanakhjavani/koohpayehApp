import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/premission/sell_user.dart';
import 'package:koohpayeh/premission/superAdmin.dart';
import 'package:koohpayeh/splash_screen.dart';

import 'features/bindings/createShopBindings.dart';
import 'features/sell_user/create_shop.dart';
import 'features/sell_user/store_list.dart';
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
          GetPage(name: '/superadmin', page: ()=> superAdmin()),
          GetPage(name: '/login', page: ()=> Login()),
          GetPage(name: '/selluser', page: ()=> Sell_user()),
          GetPage(name: "/createShop",page: ()=> CreateShop()),
          GetPage(name: "/StoreList",page: ()=> Store_list()),
          GetPage(name: "/splash",page: ()=> Splash()),
        ],
        home: Splash(),


      );
    }
  }





