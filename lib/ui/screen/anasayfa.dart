import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/ui/cubit/anasayfa_cubit.dart';
import 'package:todolist/ui/screen/todo_detail.dart';
import 'package:todolist/ui/screen/todo_register.dart';
import 'package:todolist/data/entity/to_dos.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool searchFlag = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AnasayfaCubit>().listTodos();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: searchFlag ?
          TextField(decoration: const InputDecoration(hintText: "Search"), onChanged: (aramaSonucu){
            context.read<AnasayfaCubit>().searchTodos(aramaSonucu);
          },) :
        const Text("To Do List"),
        actions: [
          searchFlag ?
          IconButton(onPressed: (){
            setState(() {searchFlag = false;});
            context.read<AnasayfaCubit>().listTodos();
          }, icon: const Icon(Icons.clear)) :
          IconButton(onPressed: (){
            setState(() {searchFlag = true;});
          }, icon: const Icon(Icons.search)),
        ],
      ),
      body: BlocBuilder<AnasayfaCubit,List<ToDos>>(
        builder: (context,todoList){
          if(todoList.isNotEmpty){
            return ListView.builder(
              itemCount: todoList.length,
              itemBuilder: (context,indeks){
                var todo = todoList[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ToDoDetail(todo: todo)))
                        .then((value) { context.read<AnasayfaCubit>().listTodos(); });
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("${todo.todo_name}"),
                        ),
                        const Spacer(),
                        IconButton(onPressed: (){
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text("Do you want to delete ${todo.todo_name}"),
                              action: SnackBarAction(
                                label: "Yes",
                                onPressed: (){
                                  context.read<AnasayfaCubit>().deleteTodo(todo.todo_id);
                                  context.read<AnasayfaCubit>().listTodos();
                                },
                              ),
                            ),
                          );
                        }, icon: const Icon(Icons.delete_outline,color: Colors.black54,)),
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const ToDoRegister()))
              .then((value) { context.read<AnasayfaCubit>().listTodos(); });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
