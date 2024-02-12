
class sellUserModel{

}

class createShopModel{
  var _imageFile;
  String _phone;
  String _address;
  String _metraj;
  String _khiabanAsli;
  String _isMalek;
  String _isBonbast;
  String _isNabsh;
  String _malekName;
  String _status;
  String _message;

  createShopModel(
      this._imageFile,
      this._phone,
      this._address,
      this._metraj,
      this._khiabanAsli,
      this._isMalek,
      this._isBonbast,
      this._isNabsh,
      this._malekName,
      this._status,
      this._message);

  String get message => _message;

  String get status => _status;

  String get malekName => _malekName;

  String get isNabsh => _isNabsh;

  String get isBonbast => _isBonbast;

  String get isMalek => _isMalek;

  String get khiabanAsli => _khiabanAsli;

  String get metraj => _metraj;

  String get address => _address;

  String get phone => _phone;

  get imageFile => _imageFile;

  set message(String value) {
    _message = value;
  }

  set status(String value) {
    _status = value;
  }

  set malekName(String value) {
    _malekName = value;
  }

  set isNabsh(String value) {
    _isNabsh = value;
  }

  set isBonbast(String value) {
    _isBonbast = value;
  }

  set isMalek(String value) {
    _isMalek = value;
  }

  set khiabanAsli(String value) {
    _khiabanAsli = value;
  }

  set metraj(String value) {
    _metraj = value;
  }

  set address(String value) {
    _address = value;
  }

  set phone(String value) {
    _phone = value;
  }

  set imageFile(value) {
    _imageFile = value;
  }
}