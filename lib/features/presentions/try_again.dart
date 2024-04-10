import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/presentions/style.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';


Widget Loading(){
  return  Center(
      child: LoadingAnimationWidget.twoRotatingArc(
          color: Colors.green, size: 30));
}




Widget TryAgain(GetxController controller) {

  return Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TryWidget(text: 'لطفا اینترنت خود را متصل کنید',
          lottieName: "disconnect",
          repeat: true),
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


Widget TryWidget({required String text,required String lottieName,required bool repeat}) {

  return Center(child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Lottie.asset('assets/json/${lottieName}.json',
          repeat: repeat,
          height: Get.height * 0.30,
          width: double.infinity,
          fit: BoxFit.fitHeight
      ),
      Text(text,style: title3,),


    ],
  ));
}





