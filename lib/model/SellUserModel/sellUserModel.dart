
class createShopModel {
  var _status;
  var _message;

  createShopModel(this._status, this._message);

   get message => _message;

  set message(value) {
    _message = value;
  }

   get status => _status;

  set status(value) {
    _status = value;
  }
}
