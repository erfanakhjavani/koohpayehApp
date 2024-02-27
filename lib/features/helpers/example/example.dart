import 'package:flutter/material.dart';
import 'package:get/get.dart';



import '../../presentions/area_supervisor/create_shop.dart';
import 'example_controller.dart';





class ProductPage extends StatelessWidget {
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {

     TextStyle style_filed = TextStyle(
        fontFamily: 'Irs',
        fontSize: 16,
        color: Color.fromRGBO(73, 73, 73, 1.0),
        fontWeight: FontWeight.w200);
     TextStyle style_button = TextStyle(
        fontFamily: 'Irs',
        fontSize: 18,
        color: Colors.green,
        fontWeight: FontWeight.w200);


    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('سفارش محصول',style: style_filed,),
      ),
      body: Obx(() {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: ListView.builder(
            itemCount: productController.products.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                      width: Get.width/ 3 - 20, // عرض عکس
                      height: Get.width/ 3 - 20, // ارتفاع عکس
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset('assets/images/sample.jpg',fit: BoxFit.cover,),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8,25,15,0),
                            child: Text(productController.products[index].name,style: style_filed,),
                          ),
                          Directionality(
                            textDirection: TextDirection.ltr,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 30),
                              child: Row(
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.remove_circle_outline
                                      ,color: Color.fromRGBO(62, 88, 20, 1.0),size: 30,),
                                    onPressed: () {
                                      if (productController.products[index].orders.value > 0) {
                                        productController.products[index].orders--;
                                      }
                                    },
                                  ),
                                  Obx(() => Text('${productController.products[index].orders}')),
                                  IconButton(
                                    icon: Icon(Icons.add_circle_outline,color: Color.fromRGBO(62, 88, 20, 1.0),size: 30,),
                                    onPressed: () {
                                      if (productController.products[index].orders.value < 20) {
                                        productController.products[index].orders++;
                                      }
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(40, 10, 10, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: Get.width/2.5,
              child: FloatingActionButton(
                onPressed: () {
                  Get.defaultDialog(title: '!موفقیت آمیز',middleText: "با موفقیت ثبت شد",
                  middleTextStyle: style_filed,

                    titleStyle: style_button,
                  );
                },
                backgroundColor: Color.fromRGBO(62, 88, 20, 1.0),
                child: Text("ثبت نهایی",style: CreateShop.style_button,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
