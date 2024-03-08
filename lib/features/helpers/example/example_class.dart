import 'package:get/get.dart';

class Product {
  String name;
  RxInt orders = 0.obs;
  String imageUrl;

  Product(this.name, this.imageUrl);
}



