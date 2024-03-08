import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/presentions/text_style.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../presentions/area_supervisor/create_shop/create_shop.dart';
import 'example_controller.dart';

class ProductPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'سفارش محصول',
            style: appbarWithb,
          ),
        ),
        body: Obx(() {
                  return Directionality(
                    textDirection: TextDirection.ltr,
                    child: ListView.builder(

                      itemCount: productController.products.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(

                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: Get.width / 3 - 20, // عرض عکس
                                      height: Get.width / 3 - 20, // ارتفاع عکس
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20.0),
                                        child: Image.asset(
                                          productController.products[index].imageUrl,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                8, 25, 15, 0),
                                            child: Text(
                                              productController.products[index].name,
                                              style: title2,
                                            ),
                                          ),
                                          Directionality(
                                            textDirection: TextDirection.ltr,
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 30,left: 20),
                                              child: Row(
                                                children: [
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.remove_circle,
                                                      color: Color.fromRGBO(
                                                          112, 112, 112,
                                                          1.0),
                                                      size: 40,
                                                    ),
                                                    onPressed: () {
                                                      if (productController
                                                              .products[index]
                                                              .orders
                                                              .value >
                                                          0) {
                                                        productController
                                                            .products[index].orders--;
                                                      }
                                                    },
                                                  ),
                                                  Obx(() => Text(
                                                      '${productController.products[index].orders.toString().toPersianDigit()}',
                                                  style: bigtitle,
                                                  )),
                                                  IconButton(
                                                    icon: Icon(
                                                      Icons.add_circle,
                                                      color: Color.fromRGBO(
                                                          48, 121, 89, 1.0),
                                                      size: 40,
                                                    ),
                                                    onPressed: () {
                                                      if (productController
                                                              .products[index]
                                                              .orders
                                                              .value <
                                                          20) {
                                                        productController
                                                            .products[index].orders++;
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
                                SizedBox(height: 5,),
                                Divider(endIndent: 30,indent: 30,)
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
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
        ));
  }
}
