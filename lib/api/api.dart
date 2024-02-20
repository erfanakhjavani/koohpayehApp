import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import '../features/sell_user/create_shop.dart';

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
}) async {


  String ismalek = '1';
  String ishashiehKhiaban = '1';
  String isnabshta = '1';
  String isbonbast = '1';

  if (isnabshtai == true) {
    isnabshta = '1';
  }else{
    isnabshta = '0';
  }if(ishashiehKhiabani == true) {
    ishashiehKhiaban = '1';
  }else {
    ishashiehKhiaban = '0';
  }if(ismaleki == true) {
    ismalek = '1';
  }else {
    ismalek = '0';
  }if(isbonbasti == true) {
    isbonbast = '1';
  }else{
    isbonbast = '0';
  }



  // Create a Uri object with the server's URL
  var uri = Uri.parse('https://crm.koohpayeh.co/api/store/save');

  // Create a new multipart request
  var request = http.MultipartRequest('POST', uri);

  // Create a multipart file using the file path and add it to the request
  var file = File(imageFile.path);
  request.files.add(await http.MultipartFile.fromPath('imageFile', file.path,
      contentType: MediaType('image', 'jpeg')));




  // Add other fields to the request
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

  // Send the request and get the response
  var response = await request.send();

  // If the request was successful, print the response body, otherwise print the status code
  if (response.statusCode == 200) {
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
      ShowMySnackBar2(context, "!اطلاعات  با موفقیت ذخیره شد");
    });
  } else {
    print('Upload failed with status: ${response.statusCode}.');
    ShowMySnackBar(context, "!مشکل در اتصال به اینترنت");
  }
}
