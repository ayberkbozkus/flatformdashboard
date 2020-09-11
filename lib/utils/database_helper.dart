import 'dart:async';
import 'dart:io';
import '../model/notification.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';


class DatabaseHelper {

  static DatabaseHelper _databaseHelper;
  static Database _database;

  String _notificationsTable = "Ticket";
  String _columnID = "id";
  String _columnIssue = "issue";
  String _columnTowho = "towho";
  String _columnMessage = "message";
  String _columnTime = "time";


  factory DatabaseHelper(){
    if(_databaseHelper == null){
      _databaseHelper= DatabaseHelper._internal();
      print("DBHelper nulldi oluşturuldu");
      return _databaseHelper;
    }else{
      print("DBHelper null değildi var olan kullanılacak");
      return _databaseHelper;
    }
  }


  DatabaseHelper._internal();

  Future<Database> _getDatabase() async{
    if(_database == null){
      print("DB nulldi oluşturulacak");
      _database = await _initializeDatabase();

      return _database;
    }else{
      print("DB null değildi var olan kullanılacak");
      return _database;
    }
  }
      
        _initializeDatabase() async{
          Directory folder =await getApplicationDocumentsDirectory();
          String dbPath = join(folder.path,"notifications.db");
          print("DB Path: "+dbPath);
          var notificationsDB = openDatabase(dbPath, version: 1, onCreate: _createDB);
          return notificationsDB;
                  }
          
          
            Future<void> _createDB(Database db, int version) async{
              print("create db metotu calıstı tablo olusturulacak");
            await  db.execute("CREATE TABLE $_notificationsTable ($_columnID INTEGER PRIMARY KEY AUTOINCREMENT, $_columnIssue TEXT, $_columnTowho TEXT, $_columnMessage TEXT, $_columnTime INTEGER )");
  }
  Future<int> notificationsAdd (Notifications notifications) async{
    var db = await _getDatabase();
    var result = await db.insert(_notificationsTable, notifications.toMap(), nullColumnHack: "$_columnID");
    
    print("notifications dbye eklendi"+result.toString());
    return result;
  }
}