import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:software_practica_cubit/bloc/items_cubit.dart';

class EditPage extends StatelessWidget {
  final String item;
  final int index;
  const EditPage({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar elemento'),
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
                List<String> items = context.read<ItemsCubit>().state.items;
                String? selectedItem =
                    BlocProvider.of<ItemsCubit>(context).state.selectedItem;
                BlocProvider.of<ItemsCubit>(context)
                    .editItem(items, index, value, selectedItem!);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
