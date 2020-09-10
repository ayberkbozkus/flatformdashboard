class Ticket {
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

  Ticket(this._issue,this._towho,this._message,this._time);
  Ticket.withID(this._id,this._issue,this._towho,this._message,this._time);

  Map<String, dynamic> toMap(){
    var map =Map <String, dynamic>();
    map['id'] = _id;
    map['issue'] = _issue;
    map['towho'] = _towho;
    map['message'] = _message;
    map['time'] = _time;
    return map; 
  }

  Ticket.fromMap(Map<String, dynamic> map){
    this._id = map['id'];
    this._issue = map['issue'];
    this._towho = map['towho'];
    this._message = map['message'];
    this._time = map['time'];
  }
  @override
  String toString() {
    return 'Ticket{_id: $_id, _issue: $_issue, _towho: $_towho, _message: $_message, _time: $_time}';
  }

}