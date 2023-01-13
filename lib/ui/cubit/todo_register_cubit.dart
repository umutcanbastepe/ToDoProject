import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/data/repo/todo_repo.dart';

class TodoRegisterCubit extends Cubit<void>{
  TodoRegisterCubit():super(0);
  var repo = TodoRepo();
  Future<void> register(String todoName) async{
    await repo.register(todoName);
  }
}