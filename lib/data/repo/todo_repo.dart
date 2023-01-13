import 'package:todolist/data/entity/to_dos.dart';
import 'package:todolist/data/sqlite/dbase.dart';

class TodoRepo{
  Future<void> register(String todoName) async{
    var db = await Dbase.accessDatabase();
    var info = Map<String,dynamic>();
    info["todo_name"] = todoName;

    await db.insert("todos",info);

  }
  Future<void> update(int todo_id,String todoName) async{
    var db = await Dbase.accessDatabase();

    var info = Map<String,dynamic>();
    info["todo_name"] = todoName;

    await db.update("todos", info,where: "todo_id=?",whereArgs: [todo_id]);
  }
  Future<List<ToDos>> list() async{
    var db = await Dbase.accessDatabase();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM todos");

    return List.generate(maps.length, (i) {//0,1
      var row = maps[i];
      return ToDos(todo_id: row["todo_id"], todo_name: row["todo_name"]);
    });
  }
  Future<List<ToDos>> search(String word) async{
    var db = await Dbase.accessDatabase();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM todos WHERE todo_name like '%$word%'");
    return List.generate(maps.length, (i) {
      var row = maps[i];
      return ToDos(todo_id: row["todo_id"], todo_name: row["todo_name"]);
    });

  }
  Future<void> remove(int todo_id) async{
    var db = await Dbase.accessDatabase();
    await db.delete("todos",where: "todo_id=?",whereArgs: [todo_id]);
  }
}