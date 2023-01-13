import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todolist/ui/cubit/anasayfa_cubit.dart';
import 'package:todolist/ui/cubit/todo_register_cubit.dart';
import 'package:todolist/ui/cubit/todo_detail_cubit.dart';
import 'package:todolist/ui/screen/anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
        BlocProvider(create: (context) => TodoRegisterCubit()),
        BlocProvider(create: (context) => TodoDetailCubit()),
        BlocProvider(create: (context) => AnasayfaCubit()),
    ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Anasayfa(),
      ),
    );
  }
}