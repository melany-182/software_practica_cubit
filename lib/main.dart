import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:software_practica_cubit/bloc/item_cubit.dart';
import 'package:software_practica_cubit/ui/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // este es el nivel más alto de la aplicación
      title: 'Ingeniería del Software - Práctica Cubit',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      // crear el BlocProvider por encima del widget que lo va a utilizar
      home: BlocProvider(
        create: (_) => ItemCubit(['a']), // lista inicial
        child: const MainPage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
