import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/controller/area_supervisor_controller/list_shop_controller.dart';
import 'package:koohpayeh/features/helpers/example/example.dart';
import 'package:koohpayeh/features/presentions/area_supervisor/edit_shop.dart';
import 'package:koohpayeh/features/presentions/text_style.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class store_detail extends GetView<listShopController> {
  final String storeName;
  final String malekName;
  final String address;
  final String phone;
  final String phoneV;
  final String khiabanasli;
  final String nabsh;
  final String bonBast;
  final String conditionMalek;
  final String sabegheh;
  final String sellerName;
  final String sellerphone;

  final String yes = 'بله';
  final String no = 'خیر';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [IconButton(onPressed: () {
            Get.to(editShop(
              address: address,
              storeName: storeName,
              phone: phone,
              bonBast: bonBast,
              conditionMalek: conditionMalek,
              khiabanasli: khiabanasli,
              nabsh: nabsh,
              phoneV: phoneV,
              sabegheh:sabegheh,
              malekName: malekName,
            ),transition: Transition.rightToLeft);
          }, icon: Icon(Icons.edit_note))],
          title: Text(
            "جزییات فروشگاه",
            style: appbarWithb,
          ),
          centerTitle: true,
        ),
        body: FutureBuilder(
            future: controller.futureStores,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(
                    child: LoadingAnimationWidget.inkDrop(
                        color: Colors.green, size: 30));
              } else if (snapshot.hasError) {
                return Center(child: Text('لطفا اینترنت خود را متصل کنید'));
              } else {
                return GetBuilder<listShopController>(builder: (controller) {
                  return Directionality(
                      textDirection: TextDirection.rtl,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: Get.height / 3,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    storeName,
                                    style: title1,
                                  ),
                                  ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.green,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                    onPressed: () {
                                      Get.to(ProductPage(),
                                          transition: Transition.topLevel);
                                    },
                                    child: Container(
                                      height: 25,
                                      child: Text(
                                        "سفارش محصول",
                                        style: titleW3,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextButton(
                                onPressed: () {},
                                child: detail("نام مالک", malekName)),
                            Divider(),
                            SingleChildScrollView(

                              child: TextButton(
                                  onPressed: () {
                                    Clipboard.setData(
                                        new ClipboardData(text: address));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Center(child: Text('کپی شد')),
                                    ));
                                  },
                                  child: detail("آدرس", address)),
                            ),
                            Divider(),
                            TextButton(
                                onPressed: () {
                                  Clipboard.setData(
                                      new ClipboardData(text: phone));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Center(child: Text('کپی شد')),
                                  ));
                                },
                                child: detail("شماره تلفن", phone)),
                            Divider(),
                            TextButton(
                                onPressed: () {
                                  Clipboard.setData(
                                      new ClipboardData(text: phoneV));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                    content: Center(child: Text('کپی شد')),
                                  ));
                                },
                                child: detail("شماره تلفن مجازی", phoneV)),
                            Divider(),
                            detail(
                                "خیابان اصلی", khiabanasli == '1' ? yes : no),
                            Divider(),
                            detail("نبش", nabsh == '1' ? yes : no),
                            Divider(),
                            detail("بن بست", bonBast == '1' ? yes : no),
                            Divider(),
                            detail("وضعیت مالک",
                                conditionMalek == '1' ? "مالک" : "مستاجر"),
                            Divider(),
                            detail("سابقه", sabegheh),
                            Divider(),
                            detail("نام فروشنده", ""),
                            Divider(),
                            detail("شماره تلفن فروشنده", ""),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ));
                });
              }
            }));
  }

  Widget detail(String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Text(
            key,
            style: titleg2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Text(
            value,
            style: title2,
          ),
        ),
      ],
    );
  }

  store_detail({
    required this.storeName,
    required this.address,
    required this.phone,
    required this.phoneV,
    required this.khiabanasli,
    required this.nabsh,
    required this.bonBast,
    required this.conditionMalek,
    required this.sabegheh,
    required this.sellerName,
    required this.sellerphone,
    required this.malekName,
  });
}
