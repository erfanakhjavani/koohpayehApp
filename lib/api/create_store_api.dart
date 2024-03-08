import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../features/presentions/area_supervisor/create_shop/create_shop.dart';
import '../features/presentions/area_supervisor/create_shop/seller_add.dart';





void sendCreateShopRequest({
  required BuildContext context,
  required String phone,
  required String address,
  required String metraj,
  required String storeName,
  required String malekName,
  required String sabeghe,
  required String majaziPhone,
  required File imageFile,
  required bool ishashiehKhiabani,
  required bool isnabshtai,
  required bool isbonbasti,
  required bool ismaleki,
  required bool khiabanFareii,
  required bool isMostajeri,
  required String area_id

}) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  // برای هر فیلد ورودی، مقدار ذخیره شده را بازیابی کنید
  String name = prefs.getString('nameSeller') ?? '';
  String family = prefs.getString('familySeller') ?? '';
  String number = prefs.getString('phoneSeller') ?? '';

  String ismalek = '1';
  String ishashiehKhiaban = '1';
  String isnabshta = '1';
  String isbonbast = '1';
  String khiabanFarei = '1';
  String isMostajer = '1';

  if (isnabshtai == true) {
    isnabshta = '1';
  } else {
    isnabshta = '0';
  }
  if (khiabanFarei == true) {
    khiabanFarei = '1';
  } else {
    khiabanFarei = '0';
  }
  if (ishashiehKhiabani == true) {
    ishashiehKhiaban = '1';
  } else {
    ishashiehKhiaban = '0';
  }
  if (ismaleki == true) {
    ismalek = '1';
  } else {
    ismalek = '0';
  }
  if (isbonbasti == true) {
    isbonbast = '1';
  } else {
    isbonbast = '0';
  }
  print(area_id);
  // Create a Uri object with the server's URL
  var uri = Uri.parse('https://crm.koohpayeh.co/api/store/save');

  // Create a new multipart request
  var request = MultipartRequest('POST', uri);

  String token = prefs.getString('token') ?? '';

  // Create a multipart file using the file path and add it to the request
  var file = File(imageFile.path);
  request.files.add(await MultipartFile.fromPath('imageFile', file.path,
      contentType: MediaType('image', 'jpeg')));

  // Add other fields to the request
  request.headers['Authorization'] = "Bearer $token";
  request.fields['phone'] = phone;
  request.fields['address'] = address;
  request.fields['malekName'] = malekName;
  request.fields['metraj'] = metraj;
  request.fields['storeName'] = storeName;
  request.fields['sabeghe'] = sabeghe;
  request.fields['khiabanAsli'] = ishashiehKhiaban;
  request.fields['isNabsh'] = isnabshta;
  request.fields['isBonbast'] = isbonbast;
  request.fields['isMalek'] = ismalek;
  request.fields['khiabanFarei'] = khiabanFarei;
  request.fields['isMostajer'] = isMostajer;
  request.fields['name[]'] = name;
  request.fields['number[]'] = number;
  request.fields['family[]'] = family;
  request.fields['area'] = area_id;


  // Send the request and get the response
  var response = await request.send();

  // If the request was successful, print the response body, otherwise print the status code
  if (response.statusCode == 200) {
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
      ShowMySnackBar2(context, "!اطلاعات  با موفقیت ذخیره شد");

      clearDataSeller();

    });
  } else {
    print('Upload failed with status: ${response.statusCode}.');
    ShowMySnackBar(context, "!مشکل در اتصال به اینترنت");
  }
}
