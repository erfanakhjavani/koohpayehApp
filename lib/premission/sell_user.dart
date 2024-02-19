import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';



void main() {
  runApp(Sell_user());
}

class Sell_user extends StatefulWidget {
  const Sell_user({Key? key}) : super(key: key);

  @override
  State<Sell_user> createState() => _Sell_userState();
}

class _Sell_userState extends State<Sell_user> {

  static TextStyle styletext = TextStyle(color: Colors.white,fontFamily: 'Irs',fontSize: 14);
  static TextStyle styletext2 = TextStyle(color: Colors.white,fontFamily: 'Irs',fontSize: 20);




  @override
  Widget build(BuildContext context) {


        return Scaffold(
          appBar: AppBar(
            title: Text('عسل کوهپایه',style: styletext2,),
            centerTitle: true,
            backgroundColor: Color.fromRGBO(62, 88, 20, 1.0),
            elevation: 1.5,
          ),
          body: Column(children: <Widget>[
            // سطر اول

            Container(
              height: 160,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                // ستون اول

                Flexible(
                    fit: FlexFit.tight,
                    child: Container(

                      decoration: BoxDecoration(

                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(8.0)),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                                color: Color.fromRGBO(
                                    88, 88, 88, 0.0),
                               offset: Offset(2, 2),
                                blurRadius: 8
                            )
                          ]),
                      margin: EdgeInsets.fromLTRB(8, 8, 4, 8),
                      padding: EdgeInsets.all(20),
                      child: TextButton(
                        onPressed: () {
                            Get.toNamed("/createShop");
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("assets/images/create_shop.svg" , width: 50, color: Colors.white,height: 55,),
                            SizedBox(height: 5,),
                            Text(
                              "ایجاد فروشگاه",
                              style: styletext,
                            )
                          ],
                        ),
                      ),
                    )
                ),
                    Flexible(
                        fit: FlexFit.tight,
                        child: Container(

                          decoration: BoxDecoration(

                              color: Colors.black,
                              borderRadius: BorderRadius.all(Radius.circular(8.0)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Color.fromRGBO(
                                        88, 88, 88, 0.0),
                                    offset: Offset(2, 2),
                                    blurRadius: 8
                                )
                              ]),
                          margin: EdgeInsets.fromLTRB(8, 8, 4, 8),
                          padding: EdgeInsets.all(20),
                          child: TextButton(
                            onPressed: () {
                              Get.toNamed("/StoreList");
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                SvgPicture.asset("assets/images/shop_list.svg" , width: 50, color: Colors.white,height: 55,),
                                SizedBox(height: 7,),
                            Text(
                              "لیست فروشگاه ها",
                              style: styletext,
                            ),

                              ],
                            ),
                          ),
                        )
                    ),

              ]),
            ),
          ]),
        );

  }
}
