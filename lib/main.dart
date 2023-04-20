import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:software_practica_cubit/bloc/items_cubit.dart';
import 'package:software_practica_cubit/ui/add_page.dart';
import 'package:software_practica_cubit/ui/edit_page.dart';
import 'package:software_practica_cubit/ui/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // este es el nivel más alto de la aplicación
    return MultiBlocProvider(
      providers: [
        BlocProvider<ItemsCubit>(
          create: (context) => ItemsCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Práctica Cubit',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const MainPage(),
          '/add': (context) => AddPage(),
          '/edit': (context) => EditPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
