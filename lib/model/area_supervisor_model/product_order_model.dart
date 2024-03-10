import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Product {
  final int? id;
  final String? title;
  final String? image;
  final List<String?> options;
  final String? createdAt;
  final String? updatedAt;
  RxInt orders;
  Product({
    required this.id,
    required this.title,
    required this.image,
    required this.options,
    required this.createdAt,
    required this.updatedAt,
    required this.orders,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      image: json['image'],
      options: List<String>.from(json['options'].map((x) => x)),
      createdAt: json['created_at'],
      updatedAt: json['updated_at'], orders: 0.obs,
    );
  }


}