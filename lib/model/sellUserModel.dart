
class sellUserModel{

}

class createShopModel{
  String _majaziPhone;
  String _malekName;
  bool _kjiabanAsli;
  bool _isNabsh;
  bool _bonbast;
  String _metraghe;
  String _sabeghe;
  bool _isMalek;

  createShopModel(this._majaziPhone, this._malekName,
      this._kjiabanAsli, this._isNabsh, this._bonbast, this._metraghe,
      this._isMalek,this._sabeghe);


  String get sabeghe => _sabeghe;

  bool get isMalek => _isMalek;

  String get metraghe => _metraghe;

  bool get bonbast => _bonbast;

  bool get isNabsh => _isNabsh;

  bool get kjiabanAsli => _kjiabanAsli;

  String get malekName => _malekName;

  String get majaziPhone => _majaziPhone;

  set sabeghe(String value) {
    _sabeghe = value;
  }


  set isMalek(bool value) {
    _isMalek = value;
  }

  set metraghe(String value) {
    _metraghe = value;
  }

  set bonbast(bool value) {
    _bonbast = value;
  }

  set isNabsh(bool value) {
    _isNabsh = value;
  }

  set kjiabanAsli(bool value) {
    _kjiabanAsli = value;
  }

  set malekName(String value) {
    _malekName = value;
  }

  set majaziPhone(String value) {
    _majaziPhone = value;
  }
}