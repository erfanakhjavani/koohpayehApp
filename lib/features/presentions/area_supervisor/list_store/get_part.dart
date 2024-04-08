import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/presentions/area_supervisor/list_store/store_list.dart';
import 'package:koohpayeh/features/presentions/try_again.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../controller/area_supervisor_controller/list_shop_controller.dart';
import '../../text_style.dart';



class GetPart extends GetView<listShopController> {
 final String? mantagheh;


  GetPart(this.mantagheh);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(

            title: Text("انتخاب بخش",style: title1,),

          ),
          body: FutureBuilder(
              future: controller.futurePart,
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
                                    borderRadius: BorderRadius.circular(50)),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                      child: Row(
                                        children: [
                                          Icon(Icons.location_on),
                                          Text(
                                            "خراسان رضوی،مشهد" + " | ",
                                            style: titleg3,
                                          ),
                                          Text(
                                            "منطقه " + mantagheh!.toPersianDigit(),
                                            style: titlegr1,
                                          ),
                                        ],
                                      )),
                                )),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () async{

                                    controller.getStores(snapshot.data![index].id);
                                    Get.off(Store_list(mantagheh, snapshot.data![index].bakhsh),
                                        transition: Transition.leftToRight);

                                  },
                                  child: Container(
                                    height: 50,
                                    width: Get.width,
                                    margin: EdgeInsets.all(5.0),
                                    decoration: BoxDecoration(
                                      color: base_colorli,
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
                                                "${snapshot.data![index].bakhsh}",
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
