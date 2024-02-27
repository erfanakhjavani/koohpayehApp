import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'package:koohpayeh/features/presentions/drawer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/presentions/area_supervisor/store_list.dart';
import '../features/presentions/area_supervisor/work_to_do.dart';


/// سرپرست فروش در منطقه

class AreaSupervisor extends StatelessWidget {

  static TextStyle styletext = TextStyle(color: Colors.white,fontFamily: 'Irs',fontSize: 14);
  static TextStyle styletext2 = TextStyle(color: Colors.white,fontFamily: 'Irs',fontSize: 20);
  static TextStyle styletext3 = TextStyle(color: Colors.black,fontFamily: 'Irs',fontSize: 20);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        title: Text('سرپرست فروش در منطقه',style: styletext2,),
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

                      color: Color.fromRGBO(89, 79, 153, 1.0),
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
                      Get.to(WorkToDo());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [

                        SvgPicture.asset("assets/images/shop_list.svg" , width: 50, color: Colors.white,height: 55,),
                        SizedBox(height: 7,),
                        Text(
                          "لیست کارها",
                          style: styletext,
                        ),

                      ],
                    ),
                  ),
                )
            ),


          ]),
        ),

        // سطر دوم
        Container(
          height: 160,
          child:
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            // ستون اول


            Flexible(
                fit: FlexFit.tight,
                child: Container(

                  decoration: BoxDecoration(

                      color: Color.fromRGBO(
                          38, 38, 38, 1.0),
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
                      Get.to(Store_list());
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
  void removeValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}
