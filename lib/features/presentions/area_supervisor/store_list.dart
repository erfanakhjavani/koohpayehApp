import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/presentions/area_supervisor/store_detail.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../controller/area_supervisor_controller/list_shop_controller.dart';
import '../text_style.dart';



void main() {
  runApp(Store_list());
}

class Store_list extends GetView<listShopController> {




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text(
          'لیست فروشگاه ها',
          style: appbarWithb
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
          future: controller.futureStores,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                  child: LoadingAnimationWidget.inkDrop(
                      color: Colors.green, size: 30));
            } else if (snapshot.hasError) {
              return Center(child: Text('لطفا اینترنت خود را متصل کنید'));
            } else {
              return GetBuilder<listShopController>(builder: (controller) {
                var filteredStores = snapshot.data!.where((store) => store.name.contains(controller.searchValue)).toList();
                return Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            controller.search(value);
                          },
                          decoration: InputDecoration(
                              labelText: "جستجو فروشگاه",
                              labelStyle: titleg3,
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)))),
                        ),
                      ),
                      Expanded(

                        child:
                      ListView.builder(
                        itemCount: filteredStores.length,
                        itemBuilder: (context,int index){
                          return InkWell(
                            onLongPress: (){},
                            onTap: (){
                              Get.to(store_detail(
                                address: snapshot.data![index].address,
                                storeName: snapshot.data![index].name,
                                phone: snapshot.data![index].phone,
                                bonBast: snapshot.data![index].bonbast,
                                conditionMalek: snapshot.data![index].isMalek,
                                khiabanasli: snapshot.data![index].khiabanAsli,
                                nabsh: snapshot.data![index].isNabsh,
                                phoneV: snapshot.data![index].majaziPhone,
                                sabegheh: snapshot.data![index].sabeghe,
                                sellerName: snapshot.data![index].user_id,
                                sellerphone: snapshot.data![index].user_id,
                                malekName: snapshot.data![index].malekName,
                              ),transition: Transition.fade);
                            },
                            child: Card(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: Get.height / 4,
                                    width: Get.width,
                                    decoration: BoxDecoration(color: Colors.grey,
                                        borderRadius: BorderRadius.only(bottomLeft: Radius.zero,
                                          bottomRight: Radius.zero,
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)
                                        )),

                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            Text(filteredStores[index].name,style: title1,),
                                            SizedBox(height: 10,),
                                            Text(filteredStores[index].address,style: titleg4,),
                                          ],
                                        ),
                                        // ElevatedButton(
                                        //
                                        //   style: ElevatedButton.styleFrom(
                                        //       shape: RoundedRectangleBorder(
                                        //           borderRadius: BorderRadius.all(Radius.circular(15))),
                                        //       side: BorderSide(width: 2,color: Colors.lightGreen),
                                        //       backgroundColor: MaterialStateColor.resolveWith((states) => Colors.green)),
                                        //   onPressed: () {
                                        //     Get.to(ProductPage(),transition: Transition.leftToRight);
                                        //   },
                                        //   child: Text(
                                        //     "سفارش محصول",
                                        //     style: titleW3,
                                        //     textAlign: TextAlign.center,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );

                        }


                        ,)
                          ),

                    ],
                  ),
                );
              });
            }
          }),
    );
  }
}
