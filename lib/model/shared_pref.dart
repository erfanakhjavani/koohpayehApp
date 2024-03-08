import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class shareData extends GetxController{
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  late String image;
  late String name;
  late String family;
  late String role;


  @override
  void onInit() async{
     await getSharedData();
    super.onInit();
  }

  void removeData() async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('image');
    prefs.remove('nameuser');
    prefs.remove('familyuser');
    prefs.remove('role');
    prefs.remove('token');
    prefs.remove('phoneUser');

  }

  Future<void> getSharedData() async {


    final SharedPreferences prefs = await SharedPreferences.getInstance();
     image = await prefs.getString('image') ?? '';
     name = await prefs.getString('nameuser') ?? '';
     family = await prefs.getString('familyuser') ?? '';
     role = await prefs.getString('role') ?? '';
     update();

  }
}