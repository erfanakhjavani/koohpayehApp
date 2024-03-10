import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/presentions/text_style.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../controller/area_supervisor_controller/order_controller.dart';
import '../create_shop/create_shop.dart';

class ProductPage extends GetView<ProductOrderController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: Get.width,
            child: FloatingActionButton(
              onPressed: () {
                Get.defaultDialog(
                  title: '!موفقیت آمیز',
                  middleText: "با موفقیت ثبت شد",
                  middleTextStyle: title3,
                  titleStyle: title4,
                );
              },
              backgroundColor: Color.fromRGBO(48, 121, 89, 1.0),
              child: Text(
                "ثبت نهایی",
                style: CreateShop.style_button,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'سفارش محصول',
            style: appbarWithb,
          ),
        ),
        body: FutureBuilder(
            future: controller.futureProduct,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: LoadingAnimationWidget.twoRotatingArc(
                        color: Colors.green, size: 30));
              } else if (snapshot.hasError) {
                return Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'لطفا اینترنت خود را متصل کنید',
                      style: title3,
                    ),
                    TextButton(
                        onPressed: () {
                          controller.onInit();
                          Get.forceAppUpdate();
                          controller.update();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.refresh,
                              color: base_color,
                            ),
                            Text(
                              "تلاش مجدد",
                              style: titlegr1,
                            )
                          ],
                        ))
                  ],
                ));
              } else {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 60),
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                        child: Container(
                          decoration: BoxDecoration(),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: Get.width / 3 - 20, // عرض عکس
                                    height: Get.width / 3 - 20, // ارتفاع عکس
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20.0),
                                      child: Image.network(
                                        "https://crm.koohpayeh.co/storage/productions/${snapshot.data![index].image!}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              8, 25, 15, 0),
                                          child: Text(
                                            snapshot.data![index].title!.toPersianDigit(),
                                            style: title2,
                                          ),
                                        ),
                                        Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 30, left: 20),
                                            child: Row(
                                              children: [
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.remove_circle,
                                                    color: Color.fromRGBO(
                                                        112, 112, 112, 1.0),
                                                    size: 30,
                                                  ),
                                                  onPressed: () {
                                                    if (snapshot.data![index]
                                                            .orders.value >
                                                        0) {
                                                      snapshot.data![index]
                                                          .orders--;
                                                    }
                                                  },
                                                ),
                                                Obx(() => Text(
                                                      '${snapshot.data![index].orders.toString().toPersianDigit()}',
                                                      style: bigtitle,
                                                    )),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.add_circle,
                                                    color: Color.fromRGBO(
                                                        48, 121, 89, 1.0),
                                                    size: 30,
                                                  ),
                                                  onPressed: () {
                                                    if (snapshot.data![index]
                                                            .orders.value <
                                                        20) {
                                                      snapshot.data![index]
                                                          .orders++;
                                                    }
                                                  },
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Divider(
                                endIndent: 30,
                                indent: 30,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
            }));
  }
}
