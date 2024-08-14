import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/presentations/area_supervisor/list_store/get_part.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../controller/area_supervisor_controller/list_shop_controller.dart';
import '../../style.dart';
import '../../try_again.dart';


class GetArea extends GetView<listShopController> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text("انتخاب منطقه",style: title1,),
      
            elevation: 0,
          ),
          body: FutureBuilder(
              future: controller.futureArea,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Loading();
                } else if (snapshot.hasError) {
                  return TryAgain(controller);
                } else {
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
      
      
                                height: 40,
                                decoration: BoxDecoration(
      
                                    borderRadius: BorderRadius.circular(50)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(child: Row(
                                    children: [
                                      Icon(Icons.location_on),
                                      Text("خراسان رضوی،مشهد",style: titlegr1,),
                                    ],
                                  )),
                                )),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () async{
                                    controller.getPart(snapshot.data![index].id);
                                    await Get.to(GetPart(snapshot.data![index].mantaghe),transition: Transition.leftToRight);
      
                                  },
                                  child: Container(
                                    height: 50,
                                    width: Get.width,
                                    margin: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: base_color,
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
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Center(
                                              child: Text(
                                                "منطقه ${(snapshot.data![index].mantaghe.toString().toPersianDigit())}",
                                                style: titleW2,
                                              )),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                }
              })),
    );
  }

}
