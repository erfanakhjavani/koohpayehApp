

class LoginResponseModel {
  // int _role_id;
  bool _success;
  String _message;


  LoginResponseModel(this._success, this._message,); //this._role_id);


  // int get role_id => _role_id;

  String get message => _message;

  bool get success => _success;


  set message(String value) {
    _message = value;
  }

  set success(bool value) {
    _success = value;
  }


//   set id(int value) {
//     _role_id = role_id;
//   }
}