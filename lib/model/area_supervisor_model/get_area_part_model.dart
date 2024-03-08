class getAreaModel {
  final int id;
  final String mantaghe;
  final String title;
  final String city_id;

  getAreaModel({
    required this.id,
    required this.mantaghe,
    required this.title,
    required this.city_id,

  });

  factory getAreaModel.fromJson(Map<String, dynamic> json) {
    return getAreaModel(
      id: json['id'],
      mantaghe: json['mantaghe'],
      title: json['title'],
      city_id: json['city_id'],

    );
  }

  static List<getAreaModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => getAreaModel.fromJson(item)).toList();
  }
}
class getPartModel {
  final int id;
  final String bakhsh;
  final String description;
  final String area_id;
  final String city_id;

  getPartModel({
    required this.id,
    required this.bakhsh,
    required this.description,
    required this.area_id,
    required this.city_id,

  });

  factory getPartModel.fromJson(Map<String, dynamic> json) {
    return getPartModel(
      id: json['id'],
      bakhsh: json['bakhsh'],
      description: json['description'],
      area_id: json['area_id'],
      city_id: json['city_id'],

    );
  }

  static List<getPartModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => getPartModel.fromJson(item)).toList();
  }
}
