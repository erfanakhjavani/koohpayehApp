import 'dart:convert';

class AreaInfoModel {
  final String title;
  final String mantaghe;
  final int id;
  final int belongsToUser;

  AreaInfoModel({required this.title, required this.mantaghe, required this.id, required this.belongsToUser});

  factory AreaInfoModel.fromJson(Map<String, dynamic> json) {
    return AreaInfoModel(
      title: json['title'],
      mantaghe: json['mantaghe'],
      id: json['id'],
      belongsToUser: json['belongsToUser'],
    );
  }
}

class StoreModel {
  final int? id;
  final String? name;
  final String? address;
  final String? phone;
  final String? majaziPhone;
  final String? malekName;
  final String? khiabanAsli;
  final String? isNabsh;
  final String? bonbast;
  final String? metraj;
  final String? sabeghe;
  final String? isMalek;
  final String? image;
  final String? description;
  final String? score;
  final String? hasOrder;
  final String? userId;
  final String? areaDetailId;
  final String? createdAt;
  final String? updatedAt;
  final int belongsToUser;
  final List<dynamic> orders;

  StoreModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.majaziPhone,
    required this.malekName,
    required this.khiabanAsli,
    this.isNabsh,
    this.bonbast,
    required this.metraj,
    required this.sabeghe,
    required this.isMalek,
    required this.image,
    this.description,
    required this.score,
    required this.hasOrder,
    required this.userId,
    required this.areaDetailId,
    required this.createdAt,
    required this.updatedAt,
    required this.belongsToUser,
    required this.orders,
  });

  factory StoreModel.fromJson(Map<String, dynamic> json) {
    return StoreModel(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      phone: json['phone'],
      majaziPhone: json['majaziPhone'],
      malekName: json['malekName'],
      khiabanAsli: json['khiabanAsli'],
      isNabsh: json['isNabsh'],
      bonbast: json['bonbast'],
      metraj: json['metraj'],
      sabeghe: json['sabeghe'],
      isMalek: json['isMalek'],
      image: json['image'],
      description: json['description'],
      score: json['score'],
      hasOrder: json['hasOrder'],
      userId: json['user_id'],
      areaDetailId: json['area_detail_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      belongsToUser: json['belongsToUser'],
      orders: json['orders'],
    );
  }
}

class ApiResponseModel {
  final int status;
  final AreaInfoModel areaInfo;
  final List<StoreModel> stores;

  ApiResponseModel({required this.status, required this.areaInfo, required this.stores});

  factory ApiResponseModel.fromJson(String str) {
    final jsonData = json.decode(str);
    return ApiResponseModel(
      status: jsonData['status'],
      areaInfo: AreaInfoModel.fromJson(jsonData['areaInfo']),
      stores: List<StoreModel>.from(jsonData['stores'].map((item) => StoreModel.fromJson(item))),
    );
  }
}
