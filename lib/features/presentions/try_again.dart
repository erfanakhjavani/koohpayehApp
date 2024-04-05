import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/presentions/text_style.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


Widget Loading(){
  return  Center(
      child: LoadingAnimationWidget.twoRotatingArc(
          color: Colors.green, size: 30));
}




Widget TryAgain(controller) {

  return Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text('لطفا اینترنت خود را متصل کنید',style: title3,),
      TextButton(

          onPressed: (){
            controller.onInit();
            Get.forceAppUpdate();
            controller.update();
          }, child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.refresh,color: base_color,),
          Text("تلاش مجدد",style: titlegr1,)
        ],))

    ],
  ));
}





