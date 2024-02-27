

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/presentions/text_style.dart';

class store_detail extends StatelessWidget {


  String storeName;
  String malekName;
  String address;
  String phone;
  String phoneV;
  String khiabanasli;
  String nabsh;
  String bonBast;
  String conditionMalek;
  String sabegheh;
  String sellerName;
  String sellerphone;

  String yes = 'بله';
  String no = 'خیر';



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  height: Get.height / 3,
                  width: Get.width,
                decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.all(Radius.circular(10))),

                    ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(storeName,style: title1,),
              ),

              SizedBox(height: 20,),
              detail("نام مالک", malekName),
              Divider(),detail("آدرس", address),
              Divider(),detail("شماره تلفن", phone),
              Divider(),detail("شماره تلفن مجازی", phoneV),
              Divider(),detail("خیابان اصلی", khiabanasli == '1'? yes : no),
              Divider(),detail("نبش", nabsh == '1'? yes : no),
              Divider(),detail("بن بست", bonBast == '1'? yes : no),
              Divider(),detail("وضعیت مالک", conditionMalek == '1'? "مالک" : "مستاجر"),
              Divider(),detail("سابقه", sabegheh),
              Divider(),detail("نام فروشنده", sellerName),
              Divider(),detail("شماره تلفن فروشنده", sellerphone),
              SizedBox(height: 20,),
            ],
          ),
        )
      ),
    );
  }
  Widget detail(String key,String value){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(20,10,20,10),
          child: Text(key,style: titleg2,),
        ),Padding(
          padding: const EdgeInsets.fromLTRB(20,10,20,10),
          child: Text(value,style: title2,),
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
