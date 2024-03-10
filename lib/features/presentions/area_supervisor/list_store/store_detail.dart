import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/controller/area_supervisor_controller/list_shop_controller.dart';
import 'package:koohpayeh/features/presentions/area_supervisor/list_store/product_order.dart';
import 'package:koohpayeh/features/presentions/area_supervisor/create_shop/edit_shop.dart';
import 'package:koohpayeh/features/presentions/text_style.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:photo_view/photo_view.dart';

import '../../image_viewer.dart';

class store_detail extends GetView<listShopController> {
  final String? storeName;
  final String? malekName;
  final String? address;
  final String? phone;
  final String? phoneV;
  final String?khiabanasli;
  final String? nabsh;
  final String? bonBast;
  final String? conditionMalek;
  final String? sabegheh;
  final String? sellerName;
  final String? sellerphone;
  final String? metraj;
  final String? image;
  final String? yes = 'بله';
  final String? no = 'خیر';

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(

            actions: [MenuBar(

              children: [
                PopupMenuButton<String>(
                  shadowColor: Colors.transparent,
                  surfaceTintColor: Colors.transparent,
                  shape: UnderlineInputBorder(),

                  itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                     PopupMenuItem<String>(
                      value: 'ویرایش فروشگاه',
                      child: Text('ویرایش فروشگاه',style: title3),
                    ),
                     PopupMenuItem<String>(
                      value: 'سفارشات',
                      child: Text('سفارشات',style: title3),
                    ),
                     PopupMenuItem<String>(
                      value: 'حذف فروشگاه',
                      child: Text('حذف فروشگاه',style: title3,),
                    ),
                  ],
                )
            ])],
            title: Text(
              "جزییات فروشگاه",
              style: appbarWithb,
            ),
            centerTitle: true,
          ),
          body: FutureBuilder(
              future: controller.futurePart,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: LoadingAnimationWidget.inkDrop(
                          color: Colors.green, size: 30));
                } else if (snapshot.hasError) {
                  return Center(child: Text('لطفا اینترنت خود را متصل کنید'));
                } else {
                  return GetBuilder<listShopController>(builder: (controller) {
                    return SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (){
                              Get.to(ImageViewer(image!,storeName!));
                            },
                            child: Container(
                              height: Get.height / 3,
                              width: Get.width,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Image.network("https://crm.koohpayeh.co/storage/images/${image}",fit: BoxFit.cover,),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  storeName.toString(),
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
                          detail(address, ''),

                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: detail("نام مالک", malekName)),
                          Divider(),
                          TextButton(
                              onPressed: () {
                                Clipboard.setData(
                                    new ClipboardData(text: phone.toString()));
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
                                    new ClipboardData(text: phoneV.toString()));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Center(child: Text('کپی شد')),
                                ));
                              },
                              child: detail("شماره تلفن مجازی", phoneV)),
                          Divider(),
                          detail(
                              "خیابان", khiabanasli == '1' ? "اصلی" : "فرعی"),
                          Divider(),
                          detail("نبش", nabsh == '1' ? yes : no),
                          Divider(),
                          detail("بن بست", bonBast == '1' ? yes : no),
                          Divider(),
                          detail("وضعیت مالک",
                              conditionMalek == '1' ? "مالک" : "مستاجر"),
                          Divider(),
                          detail("متراژ", metraj),
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
                    );
                  });
                }
              })),
    );
  }

  Widget detail(String? key, String? value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Text(
            key!,
            style: titleg2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          child:
            value.toString() == "null"
                ? Text("نامشخص",style: titleg3,) : Text(value.toString(),
            style: title2,
            )
        ),
      ],
    );
  }

  store_detail({
    required this.image,
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
    required this.metraj
  });
}
