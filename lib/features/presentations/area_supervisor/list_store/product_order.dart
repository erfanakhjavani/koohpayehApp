import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/presentations/area_supervisor/list_store/config_order.dart';
import 'package:koohpayeh/features/presentations/area_supervisor/list_store/get_area.dart';
import 'package:koohpayeh/features/presentations/style.dart';
import 'package:koohpayeh/features/presentations/try_again.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import '../../../controller/area_supervisor_controller/order_controller.dart';



class ProductPage extends GetView<ProductOrderController> {
  final int? id;
  final bool? show;



  ProductPage({this.show, this.id});


  final List<Price> _items = [
    Price("395,000", "570,000", "2,370,000",24),
    Price("273,000", "385,000", "1,638,000",23),
    Price("285,000", "410,000", "1,710,000",22),
    Price("198,000", "282,000", "1,188,000",21),
    Price("115,000", "167,000", "1,380,000",19),
    Price("77,000", "107,000", "924,000",18),


  ];






  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(show == true ? 'سفارش محصول' : "لیست محصولات (تاریخ 1403)", style: appbarWithb),
        ),
        body: Obx(() {
          if (controller.products.isEmpty) {
            return Loading();
          } else {
            return Directionality(
              textDirection: TextDirection.ltr,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60,top: 10),
                child: ListView.builder(

                  itemCount:controller.products.length,
                  itemBuilder: (context, index) {
                    var product = controller.products[index];
                    return ExpansionTile(
                      title: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: Get.width / 3 - 20, // عرض عکس
                                  height: Get.width / 3 - 20, // ارتفاع عکس
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.network(
                                      "https://crm.koohpayeh.co/storage/productions/${product.image!}",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: show == true ? EdgeInsets.fromLTRB(8, 0, 15, 0)
                                        : EdgeInsets.fromLTRB(8, 28, 15, 0),
                                        child: Text(
                                          product.title!
                                              .toString()
                                              .toPersianDigit(),
                                          style: title2,
                                        ),
                                      ),
                                      Directionality(
                                        textDirection: TextDirection.ltr,
                                        child: Padding(
                                          padding:
                                          const EdgeInsets.only(top: 30, left: 20),
                                          child: show == true ? Row(
                                            children: [
                                              IconButton(
                                                icon: Icon(
                                                  Icons.remove_circle,
                                                  color:
                                                  Color.fromRGBO(112, 112, 112, 1.0),
                                                  size: 30,
                                                ),
                                                onPressed: () {
                                                  controller.decrementOrders(product.title!);
                                                },
                                              ),
                                              Obx(() => Text(
                                                '${product.orders.toString().toPersianDigit()}',
                                                style: bigtitle,
                                              )),
                                              IconButton(
                                                icon: Icon(
                                                  Icons.add_circle,
                                                  color: Color.fromRGBO(48, 121, 89, 1.0),
                                                  size: 30,
                                                ),
                                                onPressed: () {
                                                 controller.incrementOrders(
                                                      product.title!);
                                                },
                                              ),
                                              SizedBox(width: 10,),
                                              Text(":تعداد",style: titleg3,)
                                            ],
                                          ): null
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("قیمت فاکتور:               " + "${_items[index]._gheymatFactor} ".toPersianDigit() + "تومان",style: title3,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("قیمت مصرف کننده:        "   + "${_items[index]._gheymatmasrafkonandeh} ".toPersianDigit() + "تومان",style: title3,),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("قیمت کارتنی:              "  + "${_items[index]._gheymatkartoni} ".toPersianDigit() + "تومان",style: title3,),
                              ),
                            ],
                          ),
                        )
                      ],
                      collapsedShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: BorderSide(color: Colors.grey.shade300)
                      ),
                    );
                  },
                ),
              ),
            );
          }
        }),
        floatingActionButton: show == true ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: Get.width / 2,
            child: FloatingActionButton(
              onPressed: () {
                Get.to(CheckoutPage(id: id,),transition: Transition.native);
              },
              backgroundColor: Color.fromRGBO(48, 121, 89, 1.0),
              child: Text(
                "ادامه سفارش",
                style: titleW2,
              ),
            ),

          ),
        ) : Container(
          width: Get.width ,
          child: FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.zero
            ),
            onPressed: () {
              Get.to(GetArea());
            },
            backgroundColor: Color.fromRGBO(48, 121, 89, 1.0),
            child: Text(
              "برای سفارش کلیک کنید!",
              style: titleW2,
            ),
          ),

        ),

        floatingActionButtonLocation:
        FloatingActionButtonLocation.miniCenterDocked,
      ),
    );
  }
}



class Price{
  int _id;
  String _gheymatFactor;
  String _gheymatmasrafkonandeh;
  String _gheymatkartoni;


  Price(this._gheymatFactor, this._gheymatmasrafkonandeh, this._gheymatkartoni,this._id);



  int get id => _id;

  set id(int value) {
    _id = value;
  }


  String get gheymatkartoni => _gheymatkartoni;

  set gheymatkartoni(String value) {
    _gheymatkartoni = value;
  }


  String get gheymatmasrafkonandeh => _gheymatmasrafkonandeh;

  set gheymatmasrafkonandeh(String value) {
    _gheymatmasrafkonandeh = value;
  }

  String get gheymatFactor => _gheymatFactor;

  set gheymatFactor(String value) {
    _gheymatFactor = value;
  }
}