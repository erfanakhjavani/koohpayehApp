import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:koohpayeh/features/controller/createShopController.dart';
import 'package:koohpayeh/model/SellUserModel/storeListModel.dart';



import '../../api/api.dart';

class CreateShop extends StatefulWidget {
  final storeListModel? user;

  CreateShop({this.user});


  @override
  State<CreateShop> createState() => _CreateShopState();
}

final _messengerKey = GlobalKey<ScaffoldMessengerState>();

var fieldValues = TextEditingController();

class _CreateShopState extends State<CreateShop> {





  List<bool> isSelected = [false, false, false, false];

  late File uploadImage;
  String fileName = "";
  bool _load = false;

  bool _isLoading = false;

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


  Future<void> chooseImage() async {
    final choosedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (choosedImage == null) return null;

    final imageTemp = File(choosedImage.path);

    Random random = new Random();
    int randomNumber = random.nextInt(100000);

    setState(() {
      this.uploadImage = imageTemp;
      fileName = "image_" + randomNumber.toString() + ".jpg";
      print("your file name is =" + fileName);
      _load = true;
    });
  }

  Future<void> uploadimageToServer() async {
    String uploadurl = "https://crm.koohpayeh.co/api/store/save";

    try {
      List<int> imageBytes = uploadImage.readAsBytesSync();
      String baseimage = base64Encode(imageBytes);


      var response = await post(Uri.parse(uploadurl),
          body: {'imageFile': baseimage, 'name': fileName});

      setState(() {
        _isLoading = true;
      });

      if (response.statusCode == 200) {
        var jsondata = json.decode(response.body);


        if (jsondata["status"] == 402) {
          ShowMySnackBar2(context, "تصویر با موفقیت آپلود گردید");
          setState(() {
            _isLoading = false;
          });
        } else {
          ShowMySnackBar(context, "اتصال اینترنتی با مشکل روبرو است");
        }
      }
    } catch (e) {
      return null;
    }
  }

  var index_card;

  @override
  void initState() {
    index_card = 1;

    super.initState();
  }


  var _nameStoreController = TextEditingController();
  var _nameMalekController = TextEditingController();
  var _phoneController = TextEditingController();
  var _virphoneController = TextEditingController();
  var  metrazhController = TextEditingController();
  var _historyController = TextEditingController();
  var _addressController = TextEditingController();

  late bool ishashiehKhiaban;
  late bool isnabshta;
  late bool isbonbast;
  late bool ismalek;

 var isIndicator;


  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return ScaffoldMessenger(
        key: _messengerKey,
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // image
                        InkWell(
                          onTap: () {
                            chooseImage();

                          },
                          child: Container(
                            margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                            decoration: BoxDecoration(
                                color: Colors.black12,
                                borderRadius: BorderRadius.circular(10)),
                            width: width / 3 - 20,
                            height: width / 3 - 20,
                            child: _load == true
                                ? Image.file(
                                    uploadImage,
                                    fit: BoxFit.fill,
                                  )
                                : Icon(
                                    CupertinoIcons.plus,
                                    size: 48,
                                  ),
                          ),
                        ),

                        SizedBox(
                          width: 30,
                        ),

                        // button & status

                        Column(
                          children: [
                            MaterialButton(
                              onHighlightChanged: (value){},
                              onPressed: () {
                                Image.file(
                                  uploadImage,
                                  fit: BoxFit.fill,
                                );
                              },
                              height: 50,
                              minWidth: 120,
                              color: Colors.green,
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                "انتخاب عکس",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Irs",
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _nameStoreController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
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
                          borderRadius: BorderRadius.all(Radius.circular(8)),
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
                          borderRadius: BorderRadius.all(Radius.circular(8)),
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
                          borderRadius: BorderRadius.all(Radius.circular(8)),
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
                        borderRadius: BorderRadius.all(Radius.circular(8)),
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
                          borderRadius: BorderRadius.all(Radius.circular(8)),
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
                          borderRadius: BorderRadius.all(Radius.circular(8)),
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
                  ExpansionTile(
                      backgroundColor: Colors.white,
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8))),
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
                          value: isSelected[0],
                          onChanged: (bool? value) {
                            setState(() {
                              isSelected[0] = value!;
                              ishashiehKhiaban = value;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text(
                            'نبش تقاطع',
                            style: style_filed,
                          ),
                          checkboxShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3))),
                          value: isSelected[1],
                          onChanged: (bool? value) {
                            setState(() {
                              isSelected[1] = value!;
                              isnabshta = value;
                            });
                          },
                        ),
                        CheckboxListTile(
                          title: Text(
                            'کوچه بن بست',
                            style: style_filed,
                          ),
                          checkboxShape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(3))),
                          value: isSelected[2],
                          onChanged: (bool? value) {
                            setState(() {
                              isSelected[2] = value!;
                              isbonbast = value;
                            });
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
                          value: isSelected[3],
                          onChanged: (bool? value) {
                            setState(() {
                              isSelected[3] = value!;
                              ismalek = value;
                            });
                          },
                        ),
                      ]),
                  SizedBox(
                    height: 10,
                  ),
                  savedBtn()
                ]),
              ),
            ),
          ),
        ));
  }

  Widget savedBtn() {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(62, 88, 20, 1.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        onPressed: () {
          if (_nameStoreController.text == "") {
            // error
            ShowMySnackBar(context, "لطفا نام فروشگاه را وارد نمایید");
          } else if (_nameMalekController.text == "") {
            // error
            ShowMySnackBar(context, "لطفا نام مالک را وارد نمایید");
          } else if (_phoneController.text == "") {
            // error
            ShowMySnackBar(context, "لطفا شماره تلفن را وارد نمایید");
          } else if (_virphoneController.text == "") {
            // error
            ShowMySnackBar(context, "لطفا شماره تلفن مجازی را وارد نمایید");
          } else if (metrazhController == "") {
            // error
            ShowMySnackBar(context, "لطفا متراژ را وارد نمایید");
          } else if (_historyController.text == "") {
            // error
            ShowMySnackBar(context, "لطفا سابقه فروشگاه را وارد نمایید");
          } else if (_addressController.text == "") {
            // error
            ShowMySnackBar(context, "لطفا آدرس فروشگاه را وارد نمایید");
          } else {
            sendCreateShopRequest(
                context: context,
            //    imageFile: uploadImage,
                phone: _phoneController.text,
                address: _addressController.text,
                metraj: metrazhController.hashCode,
                storeName: _nameStoreController.text,
                majaziPhone: _virphoneController.text,
                sabeghe: _historyController.text);

            //send request
          }
        },
        child: Text(
          'ذخیره',
          style: _CreateShopState.style_button,
        ),
      ),
    );
  }
}

class createSeller extends GetView<createShopController> {
  var _nameSellerController = TextEditingController();

  var _familySellerController = TextEditingController();

  var _phoneSellerController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.grey,
        title: const Text(
          "اطلاعات فروشنده",
          style:
              TextStyle(fontFamily: "Irs", fontSize: 20, color: Colors.black45),
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black45,
          ),
        ),
        elevation: 0,
      ),
      body: GetBuilder<createShopController>(builder: (context) {
        return ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: controller.indexCard,
          itemBuilder: (context, index) {
            return Directionality(
              textDirection: TextDirection.rtl,
              child: Container(
                  height: 400,
                  child: Card(
                    surfaceTintColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    elevation: 4,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 30,
                          ),

                          // نام کاربری و متن دریافتی
                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                            child: TextField(
                              controller: _nameSellerController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                labelStyle: _CreateShopState.style_filed,
                                labelText: 'نام',
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 35,
                          ),

                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                            child: TextField(
                              controller: _familySellerController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                labelStyle: _CreateShopState.style_filed,
                                labelText: 'نام خانوادگی',
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 35,
                          ),

                          Padding(
                            padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                            child: TextField(
                              controller: _phoneSellerController,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                ),
                                labelStyle: _CreateShopState.style_filed,
                                labelText: 'شماره تلفن',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(133, 35, 35, 1.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                ),
                                onPressed: () {
                                  controller.decrement();
                                },
                                child: Text(
                                  'لغو',
                                  style: _CreateShopState.style_button,
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(25, 54, 147, 1.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                  ),
                                  child: Text(
                                    'فروشنده جدید',
                                    style: _CreateShopState.style_button,
                                  ),
                                  onPressed: () {
                                    controller.increment();
                                  })
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
            );
          },
        );
      }),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.all(15)),
          FloatingActionButton(
            backgroundColor: Color.fromRGBO(62, 88, 20, 1.0),
            onPressed: () {
              if (_nameSellerController.text == "") {
                // error
                ShowMySnackBar(context, "لطفا نام فروشنده را وارد نمایید");
              } else if (_familySellerController.text == "") {
                // error
                ShowMySnackBar(context, "لطفا نام خانوادگی را وارد نمایید");
              } else if (_phoneSellerController.text == "") {
                // error
                ShowMySnackBar(context, "لطفا شماره تلفن را وارد نمایید");
              } else {
                Get.back();
              }
            },
            child: Text(
              'ذخیره',
              style: _CreateShopState.style_button,
            ),
          ),
        ],
      ),
    );
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
