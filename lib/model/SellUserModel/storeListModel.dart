class storeListModel {
  final int id;
  final String name;
  final String address;
  final String phone;
  final String majaziPhone;
  final String malekName;
  final String khiabanAsli;
  final String isNabsh;
  final String bonbast;
  final String metraj;
  final String sabeghe;
  final String isMalek;
  final String image;
  final String hasOrder;
  final String user_id;
  final String area_detail_id;
  final String created_at;
  final String updated_at;

  storeListModel({
    required this.id,
    required this.name,
    required this.address,
    required this.phone,
    required this.majaziPhone,
    required this.malekName,
    required this.khiabanAsli,
    required this.isNabsh,
    required this.bonbast,
    required this.metraj,
    required this.sabeghe,
    required this.isMalek,
    required this.image,
    required this.hasOrder,
    required this.user_id,
    required this.area_detail_id,
    required this.created_at,
    required this.updated_at,
  });

  factory storeListModel.fromJson(Map<String, dynamic> json) {
    return storeListModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      address: json['address'] ?? '',
      phone: json['phone'] ?? '',
      majaziPhone: json['majaziPhone'] ?? '',
      malekName: json['malekName'] ?? '',
      khiabanAsli: json['khiabanAsli'] ?? '',
      isNabsh: json['isNabsh'] ?? '',
      bonbast: json['bonbast'] ?? '',
      metraj: json['metraj'] ?? '',
      sabeghe: json['sabeghe'] ?? '',
      isMalek: json['isMalek'] ?? '',
      image: json['image'] ?? '',
      hasOrder: json['hasOrder'] ?? '',
      user_id: json['user_id'] ?? '',
      area_detail_id: json['area_detail_id'] ?? '',
      created_at: json['created_at'] ?? '',
      updated_at: json['updated_at'] ?? '',
    );
  }

  static List<storeListModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => storeListModel.fromJson(item)).toList();
  }
}
