import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/ui/cubit/todo_detail_cubit.dart';

import '../../data/entity/to_dos.dart';

class ToDoDetail extends StatefulWidget {
  ToDos todo;

  ToDoDetail({required this.todo});

  @override
  State<ToDoDetail> createState() => _ToDoDetailState();
}

class _ToDoDetailState extends State<ToDoDetail> {
  var tfTodoName = TextEditingController();

  @override
  void initState() {
    super.initState();
    var todo = widget.todo;
    tfTodoName.text = todo.todo_name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("To Do Details"),),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(controller: tfTodoName,decoration: const InputDecoration(hintText: "To Do Name"),),
              ElevatedButton(onPressed: (){
                context.read<TodoDetailCubit>().update(widget.todo.todo_id, tfTodoName.text);
              }, child: const Text("Update")),
            ],
        ),
      ),
    );
  }
}
