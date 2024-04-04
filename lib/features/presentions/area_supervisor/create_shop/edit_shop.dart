import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/controller/area_supervisor_controller/edit_shop_controller.dart';
import 'package:koohpayeh/features/presentions/area_supervisor/create_shop/seller_add.dart';
import 'package:koohpayeh/features/presentions/text_style.dart';
import '../../../controller/area_supervisor_controller/create_shop_controller.dart';
import '../../../controller/cemera_controller.dart';


final _messengerKey = GlobalKey<ScaffoldMessengerState>();

class EditShop extends GetView<editShopController> {

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
  final String metraj;
  final String image;




  EditShop({
    required this.storeName,
    required this.image,
    required this.address,
    required this.phone,
    required this.phoneV,
    required this.khiabanasli,
    required this.nabsh,
    required this.bonBast,
    required this.conditionMalek,
    required this.sabegheh,
    required this.malekName,
    required this.metraj,
  });


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






  @override
  Widget build(BuildContext context) {

     TextEditingController nameStoreController =  TextEditingController();
     TextEditingController nameMalekController =  TextEditingController();
     TextEditingController phoneController =  TextEditingController();
     TextEditingController virphoneController = TextEditingController();
     TextEditingController metrazhController = TextEditingController();
     TextEditingController historyController = TextEditingController();
     TextEditingController addressController = TextEditingController();


    var width = MediaQuery.of(context).size.width;
    return ScaffoldMessenger(
        key: _messengerKey,
        child: GetBuilder<editShopController>(
          builder: (controller) {
            return Directionality(
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
                    title: Text('ویرایش فروشگاه',
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
                                        fit: BoxFit.fill ,
                                      )
                                          : Image.network("https://crm.koohpayeh.co/storage/images/$image",fit: BoxFit.fill,)
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
                                                          controller.chooseImageG();
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
                          controller: nameStoreController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8)),
                              ),
                              labelStyle: style_filed,
                             labelText: 'نام فروشگاه',
                              suffixText: storeName,

                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextField(
                          controller: nameMalekController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8)),
                              ),
                              labelStyle: style_filed,
                              labelText: 'نام مالک',
                              suffixText: malekName,
                              counterStyle: style_filed),
                        ),
                        SizedBox(height: 20),
                        TextField(
                           controller: phoneController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8)),
                              ),
                              labelStyle: style_filed,
                              suffixText: phone,
                              labelText: 'شماره تلفن',
                              counterStyle: style_filed),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: virphoneController,

                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8)),
                              ),
                              labelStyle: style_filed,
                              suffixText: phoneV,
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
                            suffixText: metraj,
                            counterStyle: style_filed,
                          ),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: historyController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8)),
                              ),
                              labelStyle: style_filed,
                              labelText: 'سابقه فروشگاه',
                              suffixText: sabegheh,
                              counterStyle: style_filed),
                        ),
                        SizedBox(height: 20),
                        TextField(
                          controller: addressController,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(8)),
                              ),
                              labelStyle: style_filed,
                              suffixText: address,
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
                                          if (nameStoreController.text == "") {
                                            // error
                                            ShowMySnackBar(
                                                context,
                                                "لطفا نام فروشگاه را وارد نمایید");
                                          } else
                                          if (nameMalekController.text == "") {
                                            // error
                                            ShowMySnackBar(
                                                context,
                                                "لطفا نام مالک را وارد نمایید");
                                          } else
                                          if (phoneController.text == "") {
                                            // error
                                            ShowMySnackBar(
                                                context,
                                                "لطفا شماره تلفن را وارد نمایید");
                                          } else
                                          if (virphoneController.text == "") {
                                            // error
                                            ShowMySnackBar(context,
                                                "لطفا شماره تلفن مجازی را وارد نمایید");
                                          } else if (metrazhController == "") {
                                            // error
                                            ShowMySnackBar(
                                                context,
                                                "لطفا متراژ را وارد نمایید");
                                          } else
                                          if (historyController.text == "") {
                                            // error
                                            ShowMySnackBar(
                                                context,
                                                "لطفا سابقه فروشگاه را وارد نمایید");
                                          } else
                                          if (addressController.text == "") {
                                            // error
                                            ShowMySnackBar(
                                                context,
                                                "لطفا آدرس فروشگاه را وارد نمایید");
                                          } else {


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
            );
          }
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
