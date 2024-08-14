import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../controller/area_supervisor_controller/create_shop_controller.dart';
import 'create_shop.dart';


class createSeller extends StatelessWidget {
  final createShopController cardsController = Get.put(createShopController());





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.grey,
          title: const Text(
            "اطلاعات فروشنده",
            style: TextStyle(
                fontFamily: "Irs", fontSize: 20, color: Colors.black45),
          ),
          centerTitle: true,
          leading: InkWell(
            onTap: () {
              clearDataSeller();
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black45,
            ),
          ),
          elevation: 0,
        ),
        body: Obx(() => ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: cardsController.cards.length,
          itemBuilder: (context, index) {
            return cardsController.cards[index];
          },
        )),
        floatingActionButton:
        Row(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(padding: EdgeInsets.all(15)),

        ]));

  }


}




class CardWidget extends StatelessWidget {

  final GlobalKey<FormState> key = GlobalKey<FormState>();



  @override
  Widget build(BuildContext context) {



    final TextEditingController nameSellerController = TextEditingController();

    final TextEditingController familySellerController =
    TextEditingController();

    final TextEditingController phoneSellerController =
    TextEditingController();


    void saveDataSeller() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('nameSeller', nameSellerController.text);
      prefs.setString('familySeller', familySellerController.text);
      prefs.setString('phoneSeller', phoneSellerController.text);
    }


    return GetBuilder<createShopController>(builder: (controller) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Container(
            height: 400,
            child: Card(
              surfaceTintColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              elevation: 4,
              child: Center(
                child: Form(
                  key: key,
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),

                      // نام کاربری و متن دریافتی
                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 20, 40, 0),
                        child: TextFormField(
                          controller: nameSellerController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                            ),
                            labelStyle: CreateShop.style_filed,
                            labelText: 'نام',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              ShowMySnackBar(context, "لطفا نام فروشنده را وارد نمایید");
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(
                        height: 35,
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                        child: TextFormField(
                          controller: familySellerController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              ShowMySnackBar(context, "لطفا نام خانوادگی را وارد نمایید");
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                            ),
                            labelStyle: CreateShop.style_filed,
                            labelText: 'نام خانوادگی',
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 35,
                      ),

                      Padding(
                        padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                        child: TextFormField(
                          controller: phoneSellerController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(8)),
                            ),
                            labelStyle: CreateShop.style_filed,
                            labelText: 'شماره تلفن',
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              ShowMySnackBar(context, "لطفا شماره تلفن را وارد نمایید");
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                const Color.fromRGBO(133, 35, 35, 1.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              onPressed: () {
                                 Get.back();
                              },
                              child: Text(
                                'لغو',
                                style: CreateShop.style_button,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),

                            GetBuilder<createShopController>(
                                builder: (controller) {
                                  return ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                        const Color.fromRGBO(62, 88, 20, 1.0),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                        ),
                                      ),
                                      child: Text(
                                        'ذخیره',
                                        style: CreateShop.style_button,
                                      ),
                                      onPressed: () {
                                        if (controller.validateAll()) {
                                          saveDataSeller();
                                          Get.back();
                                        }else {
                                          ShowMySnackBar(
                                              context, 'لطفا فرم را کامل کنید');
                                        }
                                      }
                                  );
                                }
                            )
                          ]
                      ),
                    ],
                  ),
                ),
              ),
            )),
      );
    });

  }


}

void clearDataSeller() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.remove('nameSeller');
  prefs.remove('familySeller');
  prefs.remove('phoneSeller');
}