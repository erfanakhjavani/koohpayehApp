import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/controller/area_supervisor_controller/area_supervisor_controller.dart';
import 'package:koohpayeh/features/presentions/area_supervisor/list_store/get_area.dart';
import 'package:koohpayeh/features/presentions/area_supervisor/profile/Profile_a_sv.dart';
import 'package:koohpayeh/features/presentions/area_supervisor/work_to_do/work_to_do.dart';
import 'package:koohpayeh/features/presentions/area_supervisor/dashboard/dashboard_a_sv.dart';
import 'package:koohpayeh/features/presentions/text_style.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';


/// سرپرست فروش در منطقه

class AreaSupervisor extends GetView<areaSVController> {








  @override
  Widget build(BuildContext context) {
    controller.init();
    return Scaffold(

      body: Directionality(
        textDirection: TextDirection.rtl,
        child: PersistentTabView(
          context,
          controller: controller.controller,
          screens: [
            Dashboard(),
            WorkToDo(),
            GetArea(),
            Profile()

          ],
          items: [
            PersistentBottomNavBarItem(icon: const Icon(CupertinoIcons.home),
                iconSize: 28,
                title: 'داشبورد',
                activeColorPrimary: base_color,
                textStyle: title3,
                inactiveColorPrimary: Colors.black54


            ),
            PersistentBottomNavBarItem(icon: const Icon(CupertinoIcons.text_badge_checkmark),
                iconSize: 28,
                title: 'لیست کار',
                activeColorPrimary: base_color,
                textStyle: title3,
                inactiveColorPrimary: Colors.black54


            ),


            PersistentBottomNavBarItem(icon: Icon(Icons.store_sharp),
                iconSize: 28,
                title: 'فروشگاه ها',
                activeColorPrimary: base_color,
                textStyle: title3,
                inactiveColorPrimary: Colors.black54




            ),PersistentBottomNavBarItem(icon: Icon(Icons.store_sharp),
                iconSize: 28,
                title: 'کوهپایه من',
                activeColorPrimary: base_color,
                textStyle: title3,
                inactiveColorPrimary: Colors.black54




            ),



          ],

          navBarHeight: 70,
          navBarStyle: NavBarStyle.style14,
          confineInSafeArea: true,
          hideNavigationBar: false,
          stateManagement: true,
          handleAndroidBackButtonPress: true,
          resizeToAvoidBottomInset: true,
          hideNavigationBarWhenKeyboardShows: true,
          popActionScreens: PopActionScreensType.all,

          popAllScreensOnTapOfSelectedTab: true,
          itemAnimationProperties:  ItemAnimationProperties(
            curve: Curves.fastLinearToSlowEaseIn,
            duration: Duration(milliseconds: 200),
          ),
          screenTransitionAnimation:  ScreenTransitionAnimation(
              duration: Duration(milliseconds: 200),
              animateTabTransition: true,
              curve: Curves.fastLinearToSlowEaseIn,


          ),

        ),
      )
    );
  }

}
