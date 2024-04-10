
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'area_supervisor/list_store/product_order.dart';


TextStyle bigtitle = TextStyle(
    fontFamily: 'Irs',
    fontSize: 25,
    color: Colors.black87,
    fontWeight: FontWeight.w200);

TextStyle appbarWithb = TextStyle(
    fontFamily: 'Irs',
    fontSize: 20,
    color: Colors.black87,
    fontWeight: FontWeight.w200);

TextStyle title1 = TextStyle(
    fontFamily: 'Irs',
    fontSize: 20,
    color: Colors.black87,
    fontWeight: FontWeight.w200);


TextStyle title2 = TextStyle(
    fontFamily: 'Irs',
    fontSize: 18,
    color: Colors.black87,
    fontWeight: FontWeight.w200);

TextStyle title3 = TextStyle(
    fontFamily: 'Irs',
    fontSize: 16,
    color: Colors.black87,
    fontWeight: FontWeight.w200);
TextStyle title4 = TextStyle(
    fontFamily: 'Irs',
    fontSize: 14,
    color: Colors.black87,
    fontWeight: FontWeight.w200);

TextStyle appbar = TextStyle(
    fontFamily: 'Irs',
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w200);


TextStyle titleW1 = TextStyle(
    fontFamily: 'Irs',
    fontSize: 20,
    color: Colors.white,
    fontWeight: FontWeight.w200);


TextStyle titleW2 = TextStyle(
    fontFamily: 'Irs',
    fontSize: 18,
    color: Colors.white,
    fontWeight: FontWeight.w200);

TextStyle titleW3 = TextStyle(
    fontFamily: 'Irs',
    fontSize: 16,
    color: Colors.white,
    fontWeight: FontWeight.w200);
TextStyle titleW4 = TextStyle(
    fontFamily: 'Irs',
    fontSize: 14,
    color: Colors.white,
    fontWeight: FontWeight.w200);

TextStyle titleg1 = TextStyle(
    fontFamily: 'Irs',
    fontSize: 20,
    color: Colors.grey[800],
    fontWeight: FontWeight.w200);

TextStyle titleg2 = TextStyle(
    fontFamily: 'Irs',
    fontSize: 18,
    color: Colors.grey[800],
    fontWeight: FontWeight.w200);

TextStyle titleg3 = TextStyle(
    fontFamily: 'Irs',
    fontSize: 16,
    color: Colors.grey[800],
    fontWeight: FontWeight.w200);
TextStyle titleg4 = TextStyle(
    fontFamily: 'Irs',
    fontSize: 14,
    color: Colors.grey[800],
    fontWeight: FontWeight.w200);




TextStyle titlegr1 = TextStyle(
    fontFamily: 'Irs',
    fontSize: 18,
    color: base_color,
    fontWeight: FontWeight.w200);

TextStyle titlegr2 = TextStyle(
    fontFamily: 'Irs',
    fontSize: 16,
    color: base_color,
    fontWeight: FontWeight.w200);




void showMyDialog({ required BuildContext context,
  String? text,

  IconData? icon,
  Color? color,
  dynamic goToPage
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20), // این خط برای گرد کردن گوشه‌های دیالوگ است
        ),

        elevation: 5, // این خط برای ایجاد سایه برای دیالوگ است
        backgroundColor: Colors.white, // این خط رنگ پس‌زمینه دیالوگ را تعیین می‌کند
        child: Padding(
          padding: EdgeInsets.all(20), // این خط فاصله محتوای دیالوگ را از لبه‌ها تعیین می‌کند
          child: Column(
            mainAxisSize: MainAxisSize.min, // این خط باعث می‌شود دیالوگ به اندازه محتوای داخلی خود کوچک شود
            children: <Widget>[
              Icon(icon, size: 50, color: color), // این خط یک آیکون ستاره به دیالوگ اضافه می‌کند
              SizedBox(height: 25), // این خط فاصله را بین آیکون و متن تعیین می‌کند
              Text(
                text!,
                style: title3,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              TextButton(
                child: Text('بستن', style: titleg2),
                onPressed: () {
                  if(goToPage == null){
                    Get.back();
                  }
                  Get.to(goToPage);
                },
              ),
            ],
          ),
        ),
      );
    },
  );
}



const Color base_color = Color(0xff307959);
const Color base_colorli = Color(0xff594f99);
