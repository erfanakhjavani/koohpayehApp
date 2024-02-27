import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helpers/example/example2.dart';

TextStyle styletext3 =
    TextStyle(color: Colors.black, fontFamily: 'Irs', fontSize: 20);

Widget drawer() {
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        DrawerHeader(
          child: Text('koohpayeh'),
          decoration: BoxDecoration(

          ),
        ),
        ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              children: [
                Icon(Icons.settings),
                SizedBox(width: 8,),
                Text('تنظیمات',style: styletext3,),
              ],
            ),
          ),
          onTap: () {
          },
        ),
        ListTile(
          title: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              children: [
                Icon(Icons.power_settings_new),
                SizedBox(width: 8,),
                Text(
                  'خروج',
                  style: styletext3,
                ),
              ],
            ),
          ),
          onTap: () {
            Get.offAllNamed('login');
          },
        ),
      ],
    ),
  );
}
