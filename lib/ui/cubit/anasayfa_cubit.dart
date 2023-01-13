import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/data/entity/to_dos.dart';
import 'package:todolist/data/repo/todo_repo.dart';

class AnasayfaCubit extends Cubit<List<ToDos>>{
  AnasayfaCubit():super(<ToDos>[]);
  var repo = TodoRepo();

  Future <void> listTodos() async{
    var list = await repo.list();
    emit(list);
  }
  Future <void> searchTodos(String word) async{
    var list = await repo.search(word);
    emit(list);
  }
  Future<void> deleteTodo(int todo_id) async{
    await repo.remove(todo_id);
    await repo.list();
  }
}