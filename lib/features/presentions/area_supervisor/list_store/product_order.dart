import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/presentions/area_supervisor/list_store/config_order.dart';
import 'package:koohpayeh/features/presentions/style.dart';
import 'package:koohpayeh/features/presentions/try_again.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../controller/area_supervisor_controller/order_controller.dart';


class ProductPage extends GetView<ProductOrderController> {
  final int? id;



  ProductPage({this.id});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('سفارش محصول', style: appbarWithb),
        ),
        body: Obx(() {
          if (controller.products.isEmpty) {
            return Loading();
          } else {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60),
                child: ListView.builder(

                  itemCount:controller.products.length,
                  itemBuilder: (context, index) {
                    var product = controller.products[index];
                    return Container(
                      decoration: BoxDecoration(),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Container(
                                  width: Get.width / 3 - 20, // عرض عکس
                                  height: Get.width / 3 - 20, // ارتفاع عکس
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.network(
                                      "https://crm.koohpayeh.co/storage/productions/${product.image!}",
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
                                          product.title!
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
                                              IconButton(
                                                icon: Icon(
                                                  Icons.remove_circle,
                                                  color:
                                                  Color.fromRGBO(112, 112, 112, 1.0),
                                                  size: 30,
                                                ),
                                                onPressed: () {
                                                  controller.decrementOrders(product.title!);
                                                },
                                              ),
                                              Obx(() => Text(
                                                '${product.orders.toString().toPersianDigit()}',
                                                style: bigtitle,
                                              )),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.add_circle,
                                                  color: Color.fromRGBO(48, 121, 89, 1.0),
                                                  size: 30,
                                                ),
                                                onPressed: () {
                                                 controller.incrementOrders(
                                                      product.title!);
                                                },
                                              ),
                                              SizedBox(width: 10,),
                                              Text(":تعداد",style: titleg3,)
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            endIndent: 30,
                            indent: 30,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          }
        }),
        floatingActionButton: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: Get.width / 2,
            child: FloatingActionButton(
              onPressed: () {
                Get.to(CheckoutPage(id: id,),transition: Transition.native);
              },
              backgroundColor: Color.fromRGBO(48, 121, 89, 1.0),
              child: Text(
                "ادامه سفارش",
                style: titleW2,
              ),
            ),

          ),
        ),
        floatingActionButtonLocation:
        FloatingActionButtonLocation.miniCenterDocked,
      ),
    );
  }
}