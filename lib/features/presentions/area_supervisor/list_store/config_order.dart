import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/presentions/area_supervisor/list_store/get_area.dart';
import 'package:koohpayeh/features/presentions/area_supervisor/list_store/product_order.dart';
import 'package:koohpayeh/features/presentions/try_again.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../controller/area_supervisor_controller/order_controller.dart';
import '../../style.dart';

class CheckoutPage extends GetView<ProductOrderController> {
  final int? id;

  CheckoutPage({this.id});



  @override
  Widget build(BuildContext context) {
    var nonZeroProducts = controller.products
        .where((product) => product.orders.value > 0)
        .toList();
    controller.CheckBool(true);
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
              var nonZeroProducts = controller.products
                  .where((product) => product.orders.value > 0)
                  .toList();
              if (nonZeroProducts.isEmpty) {
                return Center();
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
                                padding:
                                    const EdgeInsets.fromLTRB(8, 25, 15, 0),
                                child: Text(
                                  nonZeroProducts[index]
                                      .title!
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
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Obx(() => Text(
                                            '${nonZeroProducts[index].orders.toString().toPersianDigit()}',
                                            style: bigtitle,
                                          )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        ":تعداد",
                                        style: titleg3,
                                      )
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
        floatingActionButton: nonZeroProducts.isEmpty
            ? TryWidget(
                text: 'هیچ محصولی انتخاب نشده است!',
                lottieName: "error",
                repeat: false)
            : Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: Get.width,
                  child: FloatingActionButton(
                    onPressed: () async {
                      controller.CheckBool(false);
                      try {
                        var nonZeroProducts = controller.products
                            .where((product) => product.orders.value > 0)
                            .toList();

                        var data = nonZeroProducts.map((product) {
                          return {
                            "production": product.id,
                            "number": product.orders.value
                          };
                        }).toList();

                        var payload = {"store": id, "data": data};
                        var prefs = await SharedPreferences.getInstance();
                        String token = prefs.getString('token') ?? '';

                        // آدرس API سرور خود را وارد کنید
                        var url = 'https://crm.koohpayeh.co/api/order/save';
                        var response = await http.post(
                          Uri.parse(url),
                          headers: {
                            "Content-Type": "application/json",
                            "Authorization": "Bearer $token"
                          },
                          body: json.encode(payload),
                        );

                        if (response.statusCode == 200) {
                          // درخواست با موفقیت ارسال شد
                          print('Response body: ${response.body}');
                          showMyDialog(
                              context: context,
                              text: "!سفارشات با موفقیت ثبت شد",
                              icon: Icons.verified,
                              color: base_color,
                              goToPage: ProductPage()
                          );
                          controller.CheckBool(true);
                        } else {
                          // درخواست با خطا مواجه شد
                          print(
                              'Request failed with status: ${response
                                  .statusCode}.');
                          showMyDialog(
                              context: context,
                              text: "!درخواست با خطا مواجه شد",
                              icon: Icons.sentiment_very_dissatisfied_sharp,
                              color: Colors.redAccent,
                          );
                          controller.CheckBool(true);
                        };
                      }catch(e){
                          showMyDialog(
                      context: context,
                      text: "!لطفا از اتصال به اینترنت خود مطمئن شوید",
                      icon: Icons.signal_cellular_connected_no_internet_0_bar,
                      color: base_colorli,
                      );
                          controller.CheckBool(true);
                      }
                    },
                    backgroundColor: Colors.indigo,
                    child: GetBuilder<ProductOrderController>(
                      builder: (controller) {
                        return AnimatedCrossFade(
                          firstChild: Center(
                            child: Text(
                              'تکمیل سفارش',
                              style:
                              titleW2,
                            ),
                          ),
                          secondChild: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'چند لحظه صبر کنید ',
                                style:
                                titleW2,
                              ),
                              LoadingAnimationWidget.staggeredDotsWave(
                                  color: Colors.white, size: 20),
                            ],
                          ),
                          crossFadeState:
                          controller.isFirst ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                          duration: Duration(milliseconds: 200),
                          firstCurve: Easing.emphasizedAccelerate,
                          secondCurve: Easing.emphasizedDecelerate,

                        );
                      }
                    ),
                  ),
                ),
              ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
