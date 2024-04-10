import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import '../model/area_supervisor_model/get_area_part_model.dart';
import '../model/area_supervisor_model/store_list_model.dart';





Future<List<getAreaModel>> getAreaApi() async {




  var uri = Uri.parse('https://crm.koohpayeh.co/api/store/getArea');

  SharedPreferences pref = await SharedPreferences.getInstance();
  String token = pref.getString('token') ?? '';



  final response = await http.get(uri,headers: <String, String>{
    'Authorization': 'Bearer ' + token.toString(),
  },);

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  print(token);


  if (response.statusCode == 200) {
    List<dynamic> list = json.decode(response.body)['data'];
    return list.map((item) => getAreaModel.fromJson(item)).toList();
  } else {
    Get.snackbar('Failed to load data','');
    throw Exception('Failed to load data');

  }
}



Future<List<getPartModel>> getPartApi(int id) async {




  var uri = Uri.parse('https://crm.koohpayeh.co/api/store/getBakhsh?id=$id');

  SharedPreferences pref = await SharedPreferences.getInstance();
  String token = pref.getString('token') ?? '';



  final response = await http.get(uri,headers: <String, String>{
    'Authorization': 'Bearer ' + token.toString(),
  },);

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');
  print(token);


  if (response.statusCode == 200) {
    List<dynamic> list = json.decode(response.body)['data'];
    return list.map((item) => getPartModel.fromJson(item)).toList();
  } else {
    Get.snackbar('Failed to load data','');
    throw Exception('Failed to load data');

  }
}




Future<ApiResponseModel> getlistStore(int id) async {

  var uri = Uri.parse('https://crm.koohpayeh.co/api/store/list?id=$id');

  SharedPreferences pref = await SharedPreferences.getInstance();
  String token = pref.getString('token') ?? '';



  final response = await http.get(uri,headers: <String, String>{
    'Authorization': 'Bearer ' + token.toString(),
  },);

  print('Response status: ${response.statusCode}');
  print('Response body: ${response.body}');


  if (response.statusCode == 200) {
    return ApiResponseModel.fromJson(response.body);
  } else {
    throw Exception('Failed to load data');
  }
}
