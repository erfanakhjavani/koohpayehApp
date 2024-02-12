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

final _messengerKey = GlobalKey<ScaffoldMessengerState>();




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

  var _nameStoreController = TextEditingController();
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
                      InkWell(
                        onTap: (){
                          chooseImage();
                        },
                        child: Container(
                          margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
                          decoration: BoxDecoration(
                              color: Colors.black12,
                              borderRadius: BorderRadius.circular(10)
                          ),
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

                      // button & status

                      Column(
                        children: [
                          MaterialButton(
                            onPressed: () {
                              if (uploadImage.lengthSync() < 300 * 1024) {
                                setState(() {
                                  imageStatus = "تایید شد";

                                });

                              } else {
                                setState(() {
                                  imageStatus = "حجم عکس زیاد است";
                                });
                              }if(_load == false) {
                                setState(() {
                                  imageStatus = "عکسی دریافت نشد";
                                });
                              }
                            },
                            height: 50,
                            minWidth: 120,
                            color: Colors.green,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Text(
                              "تایید عکس فروشگاه",
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
                    controller: _nameStoreController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        labelStyle: style_filed,
                        labelText: 'نام فروشگاه',
                        counterStyle: style_filed),
                  ),
                  SizedBox(height: 20),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> createSeller()));
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
          if(_nameStoreController.text == ""){

            // error
            ShowMySnackBar(context, "لطفا نام فروشگاه را وارد نمایید");


          }else if( _nameMalekController.text == ""){

            // error
            ShowMySnackBar(context, "لطفا نام مالک را وارد نمایید");

          }else if( _phoneController.text == ""){

            // error
            ShowMySnackBar(context, "لطفا شماره تلفن را وارد نمایید");

          }else if( _virphoneController.text == ""){

            // error
            ShowMySnackBar(context, "لطفا شماره تلفن مجازی را وارد نمایید");

          }else if(_metrazhController.text == ""){

            // error
            ShowMySnackBar(context, "لطفا متراژ را وارد نمایید");

          }else if( _historyController.text == ""){

            // error
            ShowMySnackBar(context, "لطفا سابقه فروشگاه را وارد نمایید");

          }else if( _addressController.text == ""){

            // error
            ShowMySnackBar(context, "لطفا آدرس فروشگاه را وارد نمایید");

          }else{
            return null;

            //send request

            // sendLoginRequest(context: context , username: _usernameController.text , password: _passwordController.text);


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

final _messengerKey2 = GlobalKey<ScaffoldMessengerState>();

class createSeller extends StatefulWidget {




  @override
  State<createSeller> createState() => _createSellerState();
}

class _createSellerState extends State<createSeller> {


  var _nameSellerController = TextEditingController();
  var _familySellerController = TextEditingController();
  var _phoneSellerController = TextEditingController();





  var index_card;

  @override
  void initState() {

    index_card = 1;

    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return MaterialApp(
          scaffoldMessengerKey: _messengerKey2,
          debugShowCheckedModeBanner: false,
          home: Scaffold(        appBar: AppBar(
            title: const Text(
              "اطلاعات فروشنده",
              style: TextStyle(
                  fontFamily: "Irs", fontSize: 20, color: Colors.black45),
            ),
            centerTitle: true,
            leading: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> CreateShop()));
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.black45,
              ),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
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
                                  padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                                  child: TextField(
                                    controller: _nameSellerController,
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
                                    controller: _familySellerController,
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
                                    controller: _phoneSellerController,
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
                                          return index_card = index_card +1;
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
                                      onPressed: () {
                                        if(_nameSellerController.text == ""){

                                          // error
                                          ShowMySnackBar2(context, "لطفا نام فروشنده را وارد نمایید");


                                        }else if(_familySellerController.text == ""){

                                          // error
                                          ShowMySnackBar2(context, "لطفا نام خانوادگی را وارد نمایید");

                                        }else if( _phoneSellerController.text == ""){

                                          // error
                                          ShowMySnackBar2(context, "لطفا شماره تلفن مجازی را وارد نمایید");

                                        }else{
                                          return null;


                                        }
                                      },
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
    );

  }


}



void ShowMySnackBar(BuildContext context , String message){

  _messengerKey.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        content:Text(message , style: TextStyle(fontFamily: "Irs" , fontSize: 17 , color: Colors.white , fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        elevation: 5,
        duration: Duration(seconds: 10),

        action: SnackBarAction(
          label: 'تایید',
          onPressed: (){},
          textColor: Colors.yellowAccent,

        ),


      )



  );







}void ShowMySnackBar2(BuildContext context , String message){

  _messengerKey2.currentState!.showSnackBar(
      SnackBar(
        backgroundColor: Colors.black,
        content:Text(message , style: TextStyle(fontFamily: "Irs" , fontSize: 17 , color: Colors.white , fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
        elevation: 5,
        duration: Duration(seconds: 10),

        action: SnackBarAction(
          label: 'تایید',
          onPressed: (){},
          textColor: Colors.yellowAccent,

        ),


      )



  );







}
