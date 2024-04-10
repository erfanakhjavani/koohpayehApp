import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/presentions/style.dart';
import 'package:shared_preferences/shared_preferences.dart';







Widget  drawer() {

  return FutureBuilder<SharedPreferences>(
    future: SharedPreferences.getInstance(),
    builder: (context,snapshot) {
      TextTheme textTheme = Theme.of(context).textTheme;
      SharedPreferences sharedPreferences = snapshot.data!;
      var image = sharedPreferences.getString('image') ?? '';
      var name = sharedPreferences.getString('nameuser') ?? '';
      var family = sharedPreferences.getString('familyuser') ?? '';


          return Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                DrawerHeader(

                  child: Center(child: Column(
                    children: [
                      Container(
                        width: 100,
                        height: 100,

                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage("https://crm.koohpayeh.co/storage/images/$image")),
                          color: Colors.grey,

                          borderRadius: BorderRadius.circular(100)
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text('$name $family',style: titleW2,),
                    ],
                  )),
                  decoration: BoxDecoration(
                    gradient:LinearGradient(colors: <Color>[Colors.blue,Colors.green]),
                  ),
                ),
                ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Row(
                      children: [
                        Icon(CupertinoIcons.sun_max_fill),
                        SizedBox(width: 8,),
                        Text('تغییر تم',style: textTheme.titleLarge,),
                      ],
                    ),
                  ),
                  onTap: () {
                    Get.changeTheme(ThemeData.dark());
                  },
                  onLongPress: (){
                    Get.changeTheme(ThemeData.light());
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
                          style: textTheme.titleLarge,
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
      );

}
