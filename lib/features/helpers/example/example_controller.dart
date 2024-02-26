import 'package:get/get.dart';

import 'example_class.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    addProduct(
      Product('عسل چند گیاه 700 گرم',''),
    );
    update();
  }

  void addProduct(Product product) {
    products.add(product);
  }

  void incrementOrders(String name) {
    int index = products.indexWhere((product) => product.name == name);
    if (index != -1 && products[index].orders < 20) {
      products[index].orders++;
      products.refresh();
    }
  }

  void decrementOrders(String name) {
    int index = products.indexWhere((product) => product.name == name);
    if (index != -1 && products[index].orders > 0) {
      products[index].orders--;
      products.refresh();
    }
  }
}