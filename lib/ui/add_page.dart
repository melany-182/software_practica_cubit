import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:software_practica_cubit/bloc/item_cubit.dart';

class AddPage extends StatelessWidget {
  final ItemCubit itemCubit;
  const AddPage({Key? key, required this.itemCubit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => itemCubit,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Añadir elemento'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Introduzca un elemento',
                ),
                onSubmitted: (value) {
                  itemCubit.addItem(value);
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
