import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/controller/area_supervisor_controller/list_shop_controller.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../features/presentations/style.dart';
import '../login.dart';
import '../model/shared_pref.dart';




/// کارشناس فروش


class SelesExpert extends GetView<listShopController>{


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'عسل کوهپایه',
            style: appbar,
          ),
          centerTitle: true,
          backgroundColor: base_color,
          elevation: 1.5,
        ),
        body: FutureBuilder(
            future: controller.futurePart,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return GetBuilder<shareData>(
                    builder: (controller) {
                      controller.onInit();
                      return Center(
                          child: LoadingAnimationWidget.inkDrop(
                              color: Colors.green, size: 30));
                    }
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('لطفا اینترنت خود را متصل کنید'));
              } else {
                return GetBuilder<shareData>(builder: (controller) {
                  return Center(
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Container(
                        width: Get.width,
                        height: Get.height / 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 200,
                                  height: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://crm.koohpayeh.co/storage/images/${controller.image}")),
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(100)),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${controller.name} ${controller.family}',
                                  style: title2,
                                ),SizedBox(
                                  height: 5,
                                ),Text(
                                  'مدیر فروش',
                                  style: title3,
                                ),SizedBox(
                                  height: 10,
                                ),Text(
                                  '${controller.role}',
                                  style: titleg4,
                                ),SizedBox(
                                  height: 10,
                                ),

                                ElevatedButton(
                                  onPressed: () {
                                    Get.offAll(Login());
                                  },

                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: base_color,
                                      shape: BeveledRectangleBorder(
                                          borderRadius: BorderRadius.circular(10)
                                      )
                                  ),
                                  child: Container(
                                    height: 25,
                                    child: Text(
                                      "خروج از حساب کاربری",
                                      style: titleW3,
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                });
              }
            }));
  }
}
