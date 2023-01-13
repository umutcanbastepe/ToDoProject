import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/ui/cubit/todo_register_cubit.dart';

class ToDoRegister extends StatefulWidget {
  const ToDoRegister({Key? key}) : super(key: key);

  @override
  State<ToDoRegister> createState() => _ToDoRegisterState();
}

class _ToDoRegisterState extends State<ToDoRegister> {
  var tfTodoName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add a new To Do"),),
      body: Center(
        child: Column(
          children: [
            TextField(controller: tfTodoName,decoration: const InputDecoration(hintText: "To Do Name"),),
            ElevatedButton(onPressed: (){
              context.read<TodoRegisterCubit>().register(tfTodoName.text);
            }, child: const Text("Add")),
          ],
        ),
      ),
    );
  }
}
