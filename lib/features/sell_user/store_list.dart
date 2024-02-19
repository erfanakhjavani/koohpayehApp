import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:koohpayeh/features/sell_user/create_shop.dart';





import '../controller/list_shop_controller.dart';

void main() {
  runApp(Store_list());
}





class Store_list extends GetView<listShopController> {



  static TextStyle style_filed = TextStyle(
      fontFamily: 'Irs',
      fontSize: 16,
      color: Color.fromRGBO(73, 73, 73, 1.0),
      fontWeight: FontWeight.w200);
  static TextStyle style_button = TextStyle(
      fontFamily: 'Irs',
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w200);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'لیست فروشگاه ها',
          style: TextStyle(
            fontFamily: 'Irs',
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: GetBuilder<listShopController>(
        init: listShopController(),
        builder: (controller) {
          return Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              children: [
          
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    onChanged: (value) {},
                    decoration: InputDecoration(
                        labelText: "جستجو در نام ها",
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(25.0)))),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(
                    
                      columns:  <DataColumn>[
                        DataColumn(
                          label: Text(
                            'شماره',
                            style: style_filed,
                          ),
                        ),DataColumn(
                          label: Text(
                            'نام فروشگاه',
                            style: style_filed,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'نام مالک',
                            style: style_filed,
                          ),
                        ),DataColumn(
                          label: Text(
                            'شماره تلفن',
                            style: style_filed,
                          ),
                        ),DataColumn(
                          label: Text(
                            'شماره مجازی',
                            style: style_filed,
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'متراژ',
                            style: style_filed,
                          ),
                        ),DataColumn(
                          label: Text(
                            'سابقه',
                            style: style_filed,
                          ),
                        ),DataColumn(
                          label: Text(
                            'عملیات',
                            style: style_filed,
                    
                          ),
                        ),
                      ],
                      rows: List.generate(controller.users.length,
                        (index) => DataRow(cells: <DataCell>[
                        DataCell(Text(controller.users[index].id)),
                        DataCell(Text(controller.users[index].storeName)),
                        DataCell(Text(controller.users[index].malekName)),
                        DataCell(Text(controller.users[index].phone)),
                        DataCell(Text(controller.users[index].VitPhone)),
                        DataCell(Text(controller.users[index].metraj)),
                        DataCell(Text(controller.users[index].sabeghe)),
                        DataCell(Row(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.visibility),
                              onPressed: () {},
                            ),
                            IconButton(
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Get.to(CreateShop(user: controller.users[index]));
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.delete,color: Colors.red[900],),
                              onPressed: () => Get.defaultDialog(
                                title: "!هشدار",
                                middleText: "آیا یرای حذف اطلاعات مطمئن هستید؟",
                                middleTextStyle: style_filed,
                                backgroundColor: Colors.white,
                                titleStyle: style_filed,
                                textConfirm: 'تایید',
                                textCancel: 'لفو',
                                onCancel: (){},
                                onConfirm: () {
                                  controller.deleteUser(controller.users[index]);
                                  Get.back();
                                }
                              ),
                            ),
                          ],
                        )),
                      ])).toList(),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}

