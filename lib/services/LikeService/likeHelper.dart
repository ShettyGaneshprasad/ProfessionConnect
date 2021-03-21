import 'package:ProfessionConnect/services/LikeService/likeModel.dart';
import 'package:ProfessionConnect/services/LikeService/likedService.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class LikeDatabaseHelper {
  static LikeDatabaseHelper _databaseHelper; // Singleton DatabaseHelper
  static Database _database; // Singleton Database

  String likeTable = 'like_table';
  String colNo = 'colNo';
  String jobId = 'jobId';

  LikeDatabaseHelper._createInstance(); // Named constructor to create instance of DatabaseHelper

  factory LikeDatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = LikeDatabaseHelper
          ._createInstance(); // This is executed only once, singleton object
    }
    return _databaseHelper;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    // Get the directory path for both Android and iOS to store database.
    Directory directory = await getApplicationDocumentsDirectory();
    String path = directory.path + 'like.db';

    // Open/create the database at a given path
    var todosDatabase =
        await openDatabase(path, version: 1, onCreate: _createDb);
    return todosDatabase;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $likeTable($colNo INTEGER PRIMARY KEY AUTOINCREMENT, $jobId TEXT, '
        ')');
  }

  // Fetch Operation: Get all todo objects from database
  Future<List<Map<String, dynamic>>> getTodoMapList() async {
    Database db = await this.database;
    var result = await db.rawQuery('SELECT * FROM $likeTable ');
    // var result = await db.query(likeTable);
    return result;
  }

  // Insert Operation: Insert a todo object to database
  Future<int> insertTodo(LikeModel likeMode) async {
    Database db = await this.database;
    var result = await db.insert(likeTable, likeMode.toMap());
    return result;
  }

  // Update Operation: Update a todo object and save it to database
  Future<int> updateLikeJobs(LikeModel likeModel) async {
    var db = await this.database;
    var result = await db.update(likeTable, likeModel.toMap(),
        where: '$colNo = ?', whereArgs: [likeModel.id]);
    return result;
  }

  // Delete Operation: Delete a todo object from database
  Future<int> unlikeJob(int jobid) async {
    var db = await this.database;
    int result =
        await db.rawDelete('DELETE FROM $likeTable WHERE $colNo = $jobid');
    return result;
  }

  // Get number of todo objects in database
  Future<int> getCountofLikedJOb() async {
    Database db = await this.database;
    List<Map<String, dynamic>> x =
        await db.rawQuery('SELECT COUNT (*) from $likeTable');
    int result = Sqflite.firstIntValue(x);
    return result;
  }

  // Get the 'Map List' [ List<Map> ] and convert it to 'todo List' [ List<Todo> ]
  Future<List<LikeModel>> getLikedJobsList() async {
    var todoMapList = await getTodoMapList(); // Get 'Map List' from database
    int count =
        todoMapList.length; // Count the number of map entries in db table

    List<LikeModel> todoList = List<LikeModel>();
    // For loop to create a 'todo List' from a 'Map List'
    for (int i = 0; i < count; i++) {
      todoList.add(LikeModel.fromMapObject(todoMapList[i]));
    }

    return todoList;
  }
}
