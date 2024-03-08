

class LoginResponseModel {
  final bool success;
  final String message;
  final User data;
  final String role;

  LoginResponseModel({required this.role, required this.success, required this.message, required this.data});
  }


class User {
  final int id;
  final String name;
  final String family;
  final String phone;
  final String roleId;
  final String image;
  final String cityId;
  final String createdAt;
  final String updatedAt;
  final String token;

  User({
    required this.id,
    required this.name,
    required this.family,
    required this.phone,
    required this.roleId,
    required this.image,
    required this.cityId,
    required this.createdAt,
    required this.updatedAt,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      family: json['family'],
      phone: json['phone'],
      roleId: json['role_id'],
      image: json['image'],
      cityId: json['city_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      token: json['token'],
    );
  }


}