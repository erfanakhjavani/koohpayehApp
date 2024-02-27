import 'package:get/get.dart';

import 'package:koohpayeh/features/controller/cemera_controller.dart';
import '../controller/area_supervisor_controller/work_to_do_controller.dart';
import '../controller/area_supervisor_controller/create_shop_controller.dart';
import '../controller/area_supervisor_controller/list_shop_controller.dart';

class MyBindings implements Bindings{
  void dependencies(){
    Get.lazyPut(() => createShopController(),fenix: true);
    Get.lazyPut(() => listShopController(),fenix: true);
    Get.lazyPut(() => cameraAgalleryController(),fenix: true);
    Get.lazyPut(() => workToDoController(),fenix: true);
  }
}