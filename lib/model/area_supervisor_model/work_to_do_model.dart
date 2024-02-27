class workToDoModel {
  final int id;
  final String isComplete;
  final String userId;
  final String areaDetailId;
  final String extention;
  final String date;
  final String request;
  final String createdAt;
  final String updatedAt;

  workToDoModel({
    required this.id,
    required this.isComplete,
    required this.userId,
    required this.areaDetailId,
    required this.extention,
    required this.date,
    required this.request,
    required this.createdAt,
    required this.updatedAt,
  });

  factory workToDoModel.fromJson(Map<String, dynamic> json) {
    return workToDoModel(
      id: json['id'],
      isComplete: json['isComplete'],
      userId: json['user_id'],
      areaDetailId: json['area_detail_id'],
      extention: json['extention'],
      date: json['date'],
      request: json['request'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  static List<workToDoModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((item) => workToDoModel.fromJson(item)).toList();
  }
}
