import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/controller/area_supervisor_controller/work_to_do_controller.dart';
import 'package:koohpayeh/features/presentions/area_supervisor/create_shop/create_shop.dart';
import 'package:koohpayeh/features/presentions/text_style.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../list_store/product_order.dart';





class WorkToDo extends GetView<workToDoController> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'لیست کارها',
          style: TextStyle(
            fontFamily: 'Irs',
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: controller.futureWTD,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: LoadingAnimationWidget.twoRotatingArc(
                      color: Colors.green, size: 30),
              );
            } else if (snapshot.hasError) {
              return Center(child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('لطفا اینترنت خود را متصل کنید',style: title3,),
                  TextButton(onPressed: (){
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
            } else {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: ListView.builder(

                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          height: 120,
                          margin: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: <Color>[Colors.green.shade100,Colors.green.shade200,Colors.green.shade300,Colors.green.shade400]),
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: InkWell(
                            onLongPress: (){},


                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('منطقه ${snapshot.data![index].id}',style: title2,),
                                    SizedBox(height: 2,),
                                      Text('بخش ${snapshot.data![index].areaDetailId}',style: title3,),
                                    SizedBox(height: 2,),
                                    Text('تاریخ انجام: ${snapshot.data![index].date.toPersianDigit()}',style: titleg3),
                                  ],
                                ),
                                 Column(
                                   mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Get.to(CreateShop(areaDetailId: snapshot.data![index].areaDetailId),transition: Transition.rightToLeft,);
                                      },
                                      child: Container(
                                        height: 25,
                                        child: Text(
                                          "ایجاد فروشگاه",
                                          style: title3,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ), ElevatedButton(
                                      style: ElevatedButton.styleFrom(backgroundColor: Colors.blueAccent),
                                      onPressed: () {

                                      },
                                      child: Container(

                                        height: 25,
                                        child: Text(
                                          "درخواست تمدید",
                                          style: titleW3,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),



                          ),
                        ),
                      ],
                    );
                  },
                ),
              );
            }
          }),
    );
  }
}