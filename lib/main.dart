import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:software_practica_cubit/bloc/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // este es el nivel más alto de la aplicación
      title: 'Ingeniería del Software - Ejemplo Cubit 1',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      // crear el BlocProvider por encima del widget que lo va a utilizar
      home: BlocProvider(
        create: (_) => CounterCubit(), // aquí se crea el Cubit
        child: const CubitHomePage(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CubitHomePage extends StatelessWidget {
  const CubitHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Incrementador Cubit'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              // abajo se muestra el estado del Cubit sin actualizarlo
              '[CUBIT] You have pushed the button this many times: ${BlocProvider.of<CounterCubit>(context).state}',
            ),
            // BlocBuilder es el que escucha al stream
            BlocBuilder<CounterCubit, int>(
              // BlocBuilder REPINTA una porción de la pantalla cada vez que cambia el estado
              builder: (context, state) => Text(
                '$state',
                style: const TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // aquí se recupera la referencia al Cubit para invocar a los eventos del Cubit,
          // así como para mostrar el estado sin actualizarlo
          BlocProvider.of<CounterCubit>(context)
              .random(); // CounterCubit.random()
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
