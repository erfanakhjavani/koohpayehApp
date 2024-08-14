import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/model/shared_pref.dart';

import '../../../../login.dart';
import '../../style.dart';

class Profile extends GetView<shareData> {


  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Align(
          alignment: Alignment.topRight,
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
                                  "https://crm.koohpayeh.co/storage/images/${controller.image}"),
                          fit: BoxFit.cover
                          ),
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
                      'سرپرست فروش در منطقه',
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
                        controller.removeData();
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
        ),
      ),
    );
  }
}
