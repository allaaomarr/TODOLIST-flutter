import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../model/taskmodel.dart';



List<Map> TasksScreen = [];
Database? DB;
class Data {
  Future<Database> createDB() async {
    String dataBasePath = await getDatabasesPath();
    print(dataBasePath);
    String path = join(dataBasePath, 'todo.db');
    print(path);
    return openDatabase(path,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE Task(id INTEGER PRIMARY KEY,title TEXT, time TEXT,date TEXT,status TEXT)');
        },
        onOpen: (db) => print("table created"));
    //
  }

  AddDB(Tasks t) async {
    var DB = await createDB();
    DB.transaction((txn) async {
      await txn
          .rawInsert(
          'INSERT INTO Task(title,time,date,status) VALUES("${t.title}","${t
              .time}", "${t.date}","${t.status}")')
          .then((value) => print('$value insert to db'));
      List<Map> list2 = await txn.rawQuery('SELECT * FROM Task');
      print(list2);
    });

  }

  GetDB(Tasks t) async {
    var DB = await createDB();
    List<Map> list =
    await DB.rawQuery('SELECT * FROM Task Where status = "task"');
    print(list);
  }
  Future<List<Tasks>> getdata() async{
    var DB = await createDB();
    List<Map<String,Object?>> datas = await DB.query("Task");
    return datas.map((e) => Tasks.fromMap(e)).toList();
  }
   Future<int>delete(int id) async{
     var DB = await createDB();
    return await DB.delete("Task",where: "id = ?",whereArgs: [id]);
   }
  Future<int> updateItem(Tasks t) async {
    var dbClient = await createDB();
    return await dbClient.update("Task", t.toMap(),
        where: "id = ?", whereArgs: [t.id]);
  }

  Future close() async {
    var dbClient = await createDB();
    return dbClient.close();
  }
}