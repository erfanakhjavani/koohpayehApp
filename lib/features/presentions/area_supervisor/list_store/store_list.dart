

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/presentions/area_supervisor/list_store/get_area.dart';
import 'package:koohpayeh/features/presentions/area_supervisor/list_store/get_part.dart';
import 'package:koohpayeh/features/presentions/area_supervisor/list_store/store_detail.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:persian_number_utility/persian_number_utility.dart';

import '../../../controller/area_supervisor_controller/list_shop_controller.dart';
import '../../text_style.dart';



class Store_list extends GetView<listShopController> {

  final String? mantagheh;
  final String? bakhsh;


  Store_list(this.mantagheh,this.bakhsh);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
              flexibleSpace : Padding(
                padding: const EdgeInsets.only(left: 10,right: 47),
                child: TextField(
                  cursorColor: base_color,
                  onChanged: (value) {
                    controller.search(value);
                  },
      
                  decoration: InputDecoration(
                    border: OutlineInputBorder(

                        borderSide: BorderSide(style: BorderStyle.solid,color: base_color),
                    borderRadius: BorderRadius.all(Radius.circular(50))
                    ),
                    hintText: "جستجو فروشگاه",
                      hintStyle: titleg3,
      
      
                      ),
                ),
              ),
          actions: [],
          ),
          body: FutureBuilder(
              future: controller.futureStores,
              builder: (context, snapshot) {
      
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                      child: LoadingAnimationWidget.twoRotatingArc(
                          color: Colors.green, size: 30));
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
                  return GetBuilder<listShopController>(builder: (controller) {
                     var filteredStores = snapshot.data!.stores.where((store) => store.name!.contains(controller.searchValue)).toList();
                    return Directionality(
                      textDirection: TextDirection.rtl,
                      child: Column(
                      children: [
                      Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
      
      
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.grey[400],
                                  borderRadius: BorderRadius.circular(50)
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Row(
                                  children: [
                                    Icon(Icons.location_on),
                                    Text("خراسان رضوی،مشهد" + " | " +
                                        "منطقه " + mantagheh.toString().toPersianDigit() +
                                        " | " +  bakhsh.toString().toPersianDigit(),style: titleg3,),
                                  ],
                                )),
                              )),
                        ],
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
                                    address: filteredStores[index].address.toString(),
                                    storeName: filteredStores[index].name.toString(),
                                    phone: filteredStores[index].phone.toString(),
                                    bonBast: filteredStores[index].bonbast.toString(),
                                    conditionMalek: filteredStores[index].isMalek.toString(),
                                    khiabanasli: filteredStores[index].khiabanAsli.toString(),
                                    nabsh: filteredStores[index].isNabsh.toString(),
                                    phoneV: filteredStores[index].majaziPhone.toString(),
                                    sabegheh: filteredStores[index].sabeghe.toString(),
                                    sellerName: filteredStores[index].userId.toString(),
                                    malekName: filteredStores[index].malekName.toString(),
                                    metraj: filteredStores[index].metraj.toString(),
                                    image: filteredStores[index].image.toString(),
                                    sellerphone: filteredStores[index].majaziPhone.toString(),
                                  ),transition: Transition.fade);
                                },
                                child: Card(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: Get.height / 4,
                                        width: Get.width,
                                        foregroundDecoration: BoxDecoration(
      
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.zero,
                                                bottomRight: Radius.zero,
                                                topLeft: Radius.circular(20),
                                                topRight: Radius.circular(20)
                                            )),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(image: NetworkImage("https://crm.koohpayeh.co/storage/images/${filteredStores[index].image}"),fit: BoxFit.cover),
                                            color: Colors.grey,
                                            borderRadius: BorderRadius.only(bottomLeft: Radius.zero,
                                              bottomRight: Radius.zero,
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)
                                            )),
                                               child: snapshot.connectionState == ConnectionState.waiting
                                                   ? Center(
                                                     child: LoadingAnimationWidget.inkDrop(
                                                         color: Colors.green, size: 30),
                                                   ) : null,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                 Text(filteredStores[index].name.toString(),style: title1,),
                                                 SizedBox(height: 10,),
                                                 Text(filteredStores[index].address.toString(),style: titleg4,),
                                              ],
                                            ),
      
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
                      ));
                  });
                }
              }),
        ),
      ),
    );
  }
}
