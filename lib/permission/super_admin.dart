import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/login.dart';
import 'package:koohpayeh/permission/sales_expert.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/presentations/drawer.dart';


///  مدیر ارشد


void main(){
  runApp(SuperAdmin());

}

class SuperAdmin extends StatelessWidget {


  static TextStyle styletext = TextStyle(color: Colors.white,fontFamily: 'Irs',fontSize: 14);
  static TextStyle styletext2 = TextStyle(color: Colors.white,fontFamily: 'Irs',fontSize: 20);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(
              title: Text('مدیر ارشد',style: styletext2,),
              centerTitle: true,
              backgroundColor: Color.fromRGBO(62, 88, 20, 1.0),
              elevation: 1.5,
            ),
            drawer: drawer(),
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

                            color: Color.fromRGBO(38, 38, 38, 1.0),
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
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/images/users.svg" , width: 50, color: Colors.white,height: 55,),
                              SizedBox(height: 5,),
                              Text(
                                "کاربران",
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

                            color: Color.fromRGBO(38, 38, 38, 1.0),
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
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              SvgPicture.asset("assets/images/honeycreate.svg" , width: 50, color: Colors.white,height: 55,),
                              SizedBox(height: 7,),
                              Text(
                                "واحد تولید",
                                style: styletext,
                              ),

                            ],
                          ),
                        ),
                      )
                  ),

                ]),
              ),Container(
                height: 160,
                child:
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  // ستون اول

                  Flexible(
                      fit: FlexFit.tight,
                      child: Container(

                        decoration: BoxDecoration(

                            color: Color.fromRGBO(38, 38, 38, 1.0),
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
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/images/reports.svg" , width: 50, color: Colors.white,height: 55,),
                              SizedBox(height: 5,),
                              Text(
                                "گزارشات",
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

                            color: Color.fromRGBO(38, 38, 38, 1.0),
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

                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              SvgPicture.asset("assets/images/sell.svg" , width: 50, color: Colors.white,height: 55,),
                              SizedBox(height: 7,),
                              Text(
                                "واحد فروش",
                                style: styletext,
                              ),

                            ],
                          ),
                        ),
                      )
                  ),

                ]),
              ),Container(
                height: 160,
                child:
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  // ستون اول

                  Flexible(
                      fit: FlexFit.tight,
                      child: Container(

                        decoration: BoxDecoration(

                            color: Color.fromRGBO(38, 38, 38, 1.0),
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
                           Get.to(SelesExpert());
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset("assets/images/store.svg" , width: 50, color: Colors.white,height: 55,),
                              SizedBox(height: 5,),
                              Text(
                                "فروشگاه",
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

                            color: Color.fromRGBO(87, 18, 18, 1.0),
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
                                removeValue('LoggedIn');
                                Get.off(Login());
                                },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [

                              SvgPicture.asset("assets/images/exit.svg" , width: 50, color: Colors.white,height: 55,),
                              SizedBox(height: 7,),
                              Text(
                                "خروج از حساب کاربری",
                                style: TextStyle(color: Colors.white,fontFamily: 'Irs',fontSize: 12),
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
  void removeValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
