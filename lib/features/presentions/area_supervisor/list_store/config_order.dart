
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/presentions/try_again.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../controller/area_supervisor_controller/order_controller.dart';
import '../../text_style.dart';

class CheckoutPage extends GetView<ProductOrderController> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'تکمیل خرید',
            style: appbarWithb,
          ),
        ),
        body: Directionality(
          textDirection: TextDirection.ltr,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(() {
              var nonZeroProducts = controller.products.where((product) => product.orders.value > 0).toList();
              if (nonZeroProducts.isEmpty) {
                return TryWidget(text:'!هیچ محصولی انتخاب نشده است',
                    lottieName: "error",
                    repeat: false
                );
              } else {
                return ListView.builder(
                  itemCount: nonZeroProducts.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          width: Get.width / 3 - 20, // عرض عکس
                          height: Get.width / 3 - 20, // ارتفاع عکس
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20.0),
                            child: Image.network(
                              "https://crm.koohpayeh.co/storage/productions/${nonZeroProducts[index].image!}",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(8, 25, 15, 0),
                                child: Text(
                                  nonZeroProducts[index].title!
                                      .toString()
                                      .toPersianDigit(),
                                  style: title2,
                                ),
                              ),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: Padding(
                                  padding:
                                  const EdgeInsets.only(top: 30, left: 20),
                                  child: Row(
                                    children: [
                                      Obx(() => Text(
                                        '${nonZeroProducts[index].orders.toString().toPersianDigit()}',
                                        style: bigtitle,
                                      )),
                                      SizedBox(width: 10,),
                                      Text(":تعداد",style: titleg3,)
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                endIndent: 30,
                                indent: 30,
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
                );
              }
            }),
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: Get.width,
            child: FloatingActionButton(
              onPressed: () {
                Get.to(CheckoutPage());
              },
              backgroundColor: Colors.indigo,
              child: Text(
                "تکمیل سفارش",
                style: titleW2,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
