external int get millisecond;
class Notifications {
  int _id;
  String _issue;
  String _towho;
  String _message;
  DateTime _time;

  int get id => _id;
  String get issue => _issue;
  String get towho => _towho;
  String get message => _message;
  DateTime get time => _time;

  set id(int value) {
    _id = value;
  }
  set issue(String value) {
    _issue = value;
  }
  set towho(String value) {
    _towho = value;
  }
  set message(String value) {
    _message = value;
  }
  set time(DateTime value) {
    _time = value;
  }

  Notifications(this._issue,this._towho,this._message,this._time);
  Notifications.withID(this._id,this._issue,this._towho,this._message,this._time);

  Map<String, dynamic> toMap(){
    var map =Map <String, dynamic>();
    map['id'] = _id;
    map['issue'] = _issue;
    map['towho'] = _towho;
    map['message'] = _message;
    map['time'] = _time.millisecondsSinceEpoch;
    return map; 
  }

    // var militime = DateTime.now().millisecondsSinceEpoch;  // integere dönüştürme
    // var deneme = DateTime.fromMillisecondsSinceEpoch(militime); // geri çevirme

  Notifications.fromMap(Map<String, dynamic> map){
    this._id = map['id'];
    this._issue = map['issue'];
    this._towho = map['towho'];
    this._message = map['message'];
    this._time = DateTime.fromMillisecondsSinceEpoch(map['time']);
  }
  @override
  String toString() {
    return 'Notifications{_id: $_id, _issue: $_issue, _towho: $_towho, _message: $_message, _time: $_time}';
  }

}