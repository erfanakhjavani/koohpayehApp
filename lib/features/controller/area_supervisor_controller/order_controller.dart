
import 'package:get/get.dart';

import 'package:koohpayeh/model/area_supervisor_model/product_order_model.dart';
import '../../../api/get_product.dart';



class ProductOrderController extends GetxController {
  late Future<List<Product>> futureProduct;
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    getProduct();
  }

  void getProduct() async {
    List<Product> productList = await get_product();
    products.value = productList;
  }

  void incrementOrders(String name) {
    int index = products.indexWhere((product) => product.title == name);
    if (index != -1 && products[index].orders < 20) {
      products[index].orders++;
      products.refresh();
    }
  }

  void decrementOrders(String name) {
    int index = products.indexWhere((product) => product.title == name);
    if (index != -1 && products[index].orders > 0) {
      products[index].orders--;
      products.refresh();
    }
  }
}