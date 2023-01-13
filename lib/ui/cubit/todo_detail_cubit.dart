import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/data/repo/todo_repo.dart';

class TodoDetailCubit extends Cubit<void>{
  TodoDetailCubit():super(0);
  var repo = TodoRepo();
  Future<void> update(int todo_id,String todoName) async{
    await repo.update(todo_id, todoName);
  }
}