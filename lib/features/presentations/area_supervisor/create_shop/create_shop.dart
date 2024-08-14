
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/presentations/area_supervisor/create_shop/seller_add.dart';
import 'package:koohpayeh/features/presentations/style.dart';


import '../../../../api/create_store_api.dart';
import '../../../controller/area_supervisor_controller/create_shop_controller.dart';
import '../../../controller/cemera_controller.dart';


final _messengerKey = GlobalKey<ScaffoldMessengerState>();

class CreateShop extends StatelessWidget {
  final String areaDetailId;

  CreateShop({required this.areaDetailId});



  static TextStyle style_filed = TextStyle(
      fontFamily: 'Irs',
      fontSize: 16,
      color: Color.fromRGBO(73, 73, 73, 1.0),
      fontWeight: FontWeight.w200);
  static TextStyle style_button = TextStyle(
      fontFamily: 'Irs',
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w200);

  final TextEditingController _nameStoreController = TextEditingController();
  final TextEditingController _nameMalekController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _virphoneController = TextEditingController();
  final TextEditingController metrazhController = TextEditingController();
  final TextEditingController _historyController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ScaffoldMessenger(
        key: _messengerKey,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(

            appBar: AppBar(
              leading: InkWell(
                onTap: () {
                  clearDataSeller();
                  Get.back();
                },
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black45,
                ),
              ),
              title: Text('ایجاد فروشگاه',
                  style: TextStyle(
                    fontFamily: 'Irs',
                    fontSize: 20,
                  )),
              centerTitle: true,
            ),
            body: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Padding(
                      padding: EdgeInsets.all(20),
                      child: Column(children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: GetBuilder<cameraAgalleryController>(
                              builder: (controller) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceAround,
                                  children: [
                                    // image
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.black12,
                                          borderRadius: BorderRadius.circular(
                                              10)),
                                      width: width / 3 - 20,
                                      height: width / 3 - 20,
                                      child: controller.load == true
                                          ? Image.file(
                                        controller.uploadImage,
                                        fit: BoxFit.fill,
                                      )
                                          : Icon(
                                        CupertinoIcons.person_crop_circle,
                                        size: 80,
                                      ),
                                    ),

                                    SizedBox(
                                      width: 30,
                                    ),

                                    // button & status

                                    Column(
                                      children: [

                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 20),
                                          child: MaterialButton(
                                            onPressed: () {
                                              Get.bottomSheet(
                                                Container(
                                                  color: Colors.white,
                                                  child: Wrap(
                                                    children: [
                                                      ListTile(
                                                        leading: Icon(
                                                            Icons.photo),
                                                        title: Text(
                                                            'انتخاب از گالری'),
                                                        onTap: () {
                                                          controller
                                                              .chooseImageG();
                                                        },
                                                      ),
                                                      ListTile(
                                                        leading: Icon(
                                                            Icons.camera_alt),
                                                        title: Text('دوربین'),
                                                        onTap: () {
                                                          controller
                                                              .chooseImageC();
                                                        },
                                                      )
                                                    ],
                                                  ),
                                                ),

                                              );
                                            },
                                            height: 50,
                                            minWidth: 120,
                                            color: Colors.green,
                                            elevation: 5,
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius
                                                  .circular(5),
                                            ),
                                            child: Text(
                                              "انتخاب عکس فروشگاه",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: "Irs",
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 25,
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              }),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        TextField(
                          controller: _nameStoreController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8)),
                              ),
                              labelStyle: style_filed,
                              labelText: 'نام فروشگاه',
                              counterStyle: style_filed),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: _nameMalekController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8)),
                              ),
                              labelStyle: style_filed,
                              labelText: 'نام مالک',
                              counterStyle: style_filed),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8)),
                              ),
                              labelStyle: style_filed,
                              labelText: 'شماره تلفن',
                              counterStyle: style_filed),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _virphoneController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8)),
                              ),
                              labelStyle: style_filed,
                              labelText: 'شماره تلفن مجازی',
                              counterStyle: style_filed),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: metrazhController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(8)),
                            ),
                            labelStyle: style_filed,
                            labelText: 'متراژ مغازه',
                            counterStyle: style_filed,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _historyController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8)),
                              ),
                              labelStyle: style_filed,
                              labelText: 'سابقه فروشگاه',
                              counterStyle: style_filed),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: _addressController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8)),
                              ),
                              labelStyle: style_filed,
                              labelText: 'آدرس فروشگاه',
                              counterStyle: style_filed),
                        ),
                        SizedBox(height: 20),
                        MaterialButton(
                          onPressed: () {
                            Get.to(createSeller());
                          },
                          height: 60,
                          minWidth: width,
                          color: Colors.green,
                          elevation: 10,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add_box,
                                color: Colors.white,
                              ),
                              SizedBox(width: 3),
                              Text(
                                "افزودن فروشنده",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Irs",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                        GetBuilder<createShopController>(builder: (controller) {
                          return ExpansionTile(
                              backgroundColor: Colors.white,
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(8))),
                              title: Text(
                                'اطلاعات فروشگاه',
                                style: style_filed,
                              ),
                              children: [
                                CheckboxListTile(
                                  title: Text('حاشیه خیابان اصلی'),
                                  checkboxShape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                                  value: controller.isSelected[0],
                                  onChanged: (bool? value) {

                                    controller.isSelected[0] = value!;
                                    controller.select();

                                  },
                                ),
                                CheckboxListTile(
                                  title: Text(
                                    'حاشیه خیابان فرعی',
                                    style: style_filed,
                                  ),
                                  checkboxShape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                                  value: controller.isSelected[1],
                                  onChanged: (bool? value) {

                                    controller.isSelected[1] = value!;
                                    controller.select();
                                  },
                                ),CheckboxListTile(
                                  title: Text(
                                    'نبش تقاطع',
                                    style: style_filed,
                                  ),
                                  checkboxShape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                                  value: controller.isSelected[2],
                                  onChanged: (bool? value) {
                                    controller.isSelected[2] = value!;
                                    controller.select();
                                  },
                                ),CheckboxListTile(
                                  title: Text(
                                    'کوچه بن بست',
                                    style: style_filed,
                                  ),
                                  checkboxShape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                                  value: controller.isSelected[3],
                                  onChanged: (bool? value) {
                                    controller.isSelected[3] = value!;
                                    controller.select();
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text(
                                    'مالک',
                                    style: style_filed,
                                  ),
                                  checkboxShape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                                  value: controller.isSelected[4],
                                  onChanged: (bool? value) {
                                    controller.isSelected[4] = value!;
                                    controller.select();
                                  },
                                ),
                                CheckboxListTile(
                                  title: Text(
                                    'مستاجر',
                                    style: style_filed,
                                  ),
                                  checkboxShape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                                  value: controller.isSelected[5],
                                  onChanged: (bool? value) {
                                    controller.isSelected[5] = value!;
                                    controller.select();
                                  },
                                ),
                              ]);
                        }),
                        SizedBox(
                          height: 10,
                        ),
                        GetBuilder<createShopController>(
                            builder: (controller) {
                              return GetBuilder<cameraAgalleryController>(
                                  builder: (ccontroller) {
                                    return SizedBox(
                                      width: double.infinity,
                                      height: 55,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                          base_color,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                15.0),
                                          ),
                                        ),
                                        onPressed: () {
                                          if (ccontroller.load == false) {
                                            ShowMySnackBar(
                                                context,
                                                "لطفا عکس فروشگاه را وارد نمایید");
                                          } else
                                          if (_nameStoreController.text == "") {
                                            // error
                                            ShowMySnackBar(
                                                context,
                                                "لطفا نام فروشگاه را وارد نمایید");
                                          } else
                                          if (_nameMalekController.text == "") {
                                            // error
                                            ShowMySnackBar(
                                                context,
                                                "لطفا نام مالک را وارد نمایید");
                                          } else
                                          if (_phoneController.text == "") {
                                            // error
                                            ShowMySnackBar(
                                                context,
                                                "لطفا شماره تلفن را وارد نمایید");
                                          } else
                                          if (_virphoneController.text == "") {
                                            // error
                                            ShowMySnackBar(context,
                                                "لطفا شماره تلفن مجازی را وارد نمایید");
                                          } else if (metrazhController == "") {
                                            // error
                                            ShowMySnackBar(
                                                context,
                                                "لطفا متراژ را وارد نمایید");
                                          } else
                                          if (_historyController.text == "") {
                                            // error
                                            ShowMySnackBar(
                                                context,
                                                "لطفا سابقه فروشگاه را وارد نمایید");
                                          } else
                                          if (_addressController.text == "") {
                                            // error
                                            ShowMySnackBar(
                                                context,
                                                "لطفا آدرس فروشگاه را وارد نمایید");
                                          } else {
                                            sendCreateShopRequest(
                                              context: context,
                                              malekName: _nameMalekController
                                                  .text,
                                              imageFile: ccontroller
                                                  .uploadImage,
                                              phone: _phoneController.text,
                                              address: _addressController.text,
                                              metraj: metrazhController.text,
                                              storeName: _nameStoreController
                                                  .text,
                                              majaziPhone: _virphoneController
                                                  .text,
                                              sabeghe: _historyController.text,
                                              ishashiehKhiabani: controller
                                                  .isSelected[0],
                                              khiabanFareii: controller
                                                  .isSelected[1],
                                              isnabshtai: controller
                                                  .isSelected[2],
                                              isbonbasti: controller
                                                  .isSelected[3],
                                              ismaleki: controller
                                                  .isSelected[4],
                                              isMostajeri: controller
                                                  .isSelected[5],
                                              area_id: areaDetailId,


                                            );

                                            //send request
                                          }
                                        },
                                        child: Text(
                                          'ذخیره',
                                          style: style_button,
                                        ),
                                      ),
                                    );
                                  }
                              );
                            })
                      ]),
                    ),
                  )



          ),
        ));
  }
}



void ShowMySnackBar(BuildContext context, String message) {
  _messengerKey.currentState!.showSnackBar(Get.snackbar(
    '',
    '',
    barBlur: 50,
    titleText: Text(
      ":خطا",
      style: TextStyle(
          fontFamily: "Irs",
          fontSize: 17,
          color: Colors.red,
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ),
    messageText: Text(
      message,
      style: TextStyle(
          fontFamily: "Irs",
          fontSize: 17,
          color: Colors.black87,
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 3),
  ) as SnackBar);
}

void ShowMySnackBar2(BuildContext context, String message) {
  _messengerKey.currentState!.showSnackBar(Get.snackbar(
    '',
    '',
    barBlur: 50,
    titleText: Text(
      "موفقت آمیز",
      style: TextStyle(
          fontFamily: "Irs",
          fontSize: 17,
          color: Colors.green,
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ),
    messageText: Text(
      message,
      style: TextStyle(
          fontFamily: "Irs",
          fontSize: 17,
          color: Colors.black87,
          fontWeight: FontWeight.bold),
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 3),
  ) as SnackBar);
}
