

import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class areaSVController extends GetxController{

  late PersistentTabController controller;


  void init() {
    controller = PersistentTabController(initialIndex: 0);
    controller.addListener(() {
      onInit();
    });

    controller.index;
    update();


  }


}