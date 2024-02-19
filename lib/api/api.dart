import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';
import '../features/sell_user/create_shop.dart';
import '../model/SellUserModel/sellUserModel.dart';




void sendCreateShopRequest({required BuildContext context ,
  required String phone,
  required String address,
  required int metraj,
 // required File imageFile,
  required String storeName,
  required String sabeghe,
  required String majaziPhone,}) async{




  var body = Map<String , dynamic>();

  body["phone"]=phone;
  body["address"]=address;
  body["metraj"]=metraj;
 // body["imageFile"]=imageFile;
  body["storeName"]=storeName;
  body["sabeghe"]=sabeghe;
  body["majaziPhone"]=majaziPhone;


  var response = await post(Uri.parse('https://crm.koohpayeh.co/api/store/save') , body: body);

  if( response.statusCode == 200){

    // Result

    var createShopJson = json.decode(utf8.decode(response.bodyBytes));
    var model = createShopModel(createShopJson["status"] ,
      createShopJson["message"],
    );



    if( createShopJson["status"]== 200.toString()){


      print(model.message);
      ShowMySnackBar(context, model.message);







    }else{

      print(model.message);
      ShowMySnackBar(context, model.message);


    }

  }










}





