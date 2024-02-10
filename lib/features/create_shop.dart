import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateShop extends StatefulWidget {
  CreateShop({super.key});

  @override
  State<CreateShop> createState() => _CreateShopState();
}

var fieldValues = TextEditingController();

class _CreateShopState extends State<CreateShop> {
  final myController = TextEditingController();

  List<bool> isSelected = [false, false, false, false];

  String imageStatus = "نامشخص";

  late File uploadImage;
  String fileName = "";
  bool _load = false;

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

  var index_card;

  @override
  void initState() {

    index_card = 1;

    super.initState();

  }

  var _nameMalekController = TextEditingController();
  var _phoneController = TextEditingController();
  var _virphoneController = TextEditingController();
  var _metrazhController = TextEditingController();
  var _historyController = TextEditingController();
  var _addressController = TextEditingController();

  late bool _hashiehKhiaban;
  late bool _nabshta;
  late bool _bonbast;
  late bool _malek;

  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: _messengerKey,
        home: Directionality(
          textDirection: TextDirection.rtl,
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                'ایجاد فروشگاه',
                style: TextStyle(
                    fontFamily: 'Irs',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              centerTitle: true,
              backgroundColor: Color.fromRGBO(62, 88, 20, 1.0),
              elevation: 1.5,
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      // image
                      GestureDetector(
                        onTap: () {
                          chooseImage();
                        },
                        child: Container(
                          margin: EdgeInsets.only(left: 16),
                          width: width / 3 - 20,
                          height: width / 3 - 20,
                          color: Colors.black12,
                          child: _load == true
                              ? Image.file(
                                  uploadImage,
                                  width: 250,
                                  height: 250,
                                )
                              : Icon(
                                  CupertinoIcons.plus,
                                  size: 48,
                                ),
                        ),
                      ),

                      // button & status

                      Column(
                        children: [
                          MaterialButton(
                            onPressed: () {},
                            height: 50,
                            minWidth: 120,
                            color: Colors.green,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "آپلود عکس فروشگاه",
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
                          Text(
                            imageStatus,
                            style: style_filed,
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
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
                    controller: _metrazhController,
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => createSeller()));
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
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Color.fromRGBO(62, 88, 20, 1.0)),
                          value: isSelected[0],
                          onChanged: (bool? value) {
                            setState(() {
                              isSelected[0] = value!;
                              _hashiehKhiaban = value;
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
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Color.fromRGBO(62, 88, 20, 1.0)),
                          value: isSelected[1],
                          onChanged: (bool? value) {
                            setState(() {
                              isSelected[1] = value!;
                              _nabshta = value;
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
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Color.fromRGBO(62, 88, 20, 1.0)),
                          value: isSelected[2],
                          onChanged: (bool? value) {
                            setState(() {
                              isSelected[2] = value!;
                              _bonbast = value;
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
                          fillColor: MaterialStateColor.resolveWith(
                              (states) => Color.fromRGBO(62, 88, 20, 1.0)),
                          value: isSelected[3],
                          onChanged: (bool? value) {
                            setState(() {
                              isSelected[3] = value!;
                              _malek = value;
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
      onPressed: () {},
      child: Text(
        'ذخیره',
        style: _CreateShopState.style_button,
      ),
    ),
  );
}

class createSeller extends StatefulWidget {




  @override
  State<createSeller> createState() => _createSellerState();
}

class _createSellerState extends State<createSeller> {


  var index_card;

  @override
  void initState() {

    index_card = 1;

    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: index_card,
        itemBuilder: (context, index) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Container(
                height: 400,
                child: Card(
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
                          padding: EdgeInsets.fromLTRB(0, 0, 30, 0),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "اطلاعات فروشنده",
                              style: _CreateShopState.style_filed,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                          child: TextField(

                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
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
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
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
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(8)),
                                ),
                                labelStyle: _CreateShopState.style_filed,
                                labelText: 'شماره تلفن',
                                ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(
                                    133, 35, 35, 1.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  index_card = index_card - 1;
                                });
                                if(index_card == 0){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateShop()));
                                }
                              },
                              child: Text(
                                'لغو',
                                style: _CreateShopState.style_button,
                              ),
                            ),
                            SizedBox(width: 10,),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(
                                    25, 54, 147, 1.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              onPressed: () {
                                setState(() {
                                  index_card = index_card + 1 ;
                                });
                              },
                              child: Text(
                                'فروشنده جدید',
                                style: _CreateShopState.style_button,
                              ),
                            ),

                            SizedBox(width: 10,),

                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromRGBO(
                                    8, 122, 66, 1.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                'ذخیره',
                                style: _CreateShopState.style_button,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          );
        },
      )),
    );
  }
}
