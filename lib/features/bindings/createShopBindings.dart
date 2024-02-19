import 'package:get/get.dart';
import '../controller/createShopController.dart';
import '../controller/list_shop_controller.dart';

class MyBindings implements Bindings{
  void dependencies(){
    Get.lazyPut(() => createShopController(),fenix: true);
    Get.lazyPut(() => listShopController(),fenix: true);
  }
}