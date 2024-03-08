

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/controller/area_supervisor_controller/list_shop_controller.dart';


void main(){

  testWidgets("بررسی دریافت داده های فروشگاه ها از لیست مدل", (tester) async{

    await tester.pumpWidget(GetBuilder<listShopController>(
      builder: (controller) {
        return FutureBuilder(
            future: controller.futureStores,
            builder: (context, snapshot) {
              snapshot.connectionState == ConnectionState.waiting;
                  if(snapshot.hasError){
              return Text("fuck");
              }else{
                return Text("yes");
              }
            });

      })
    );

  }

  );
}