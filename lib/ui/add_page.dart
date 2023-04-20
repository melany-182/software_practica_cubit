import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:software_practica_cubit/bloc/items_cubit.dart';

class AddPage extends StatelessWidget {
  AddPage({Key? key}) : super(key: key);

  final itemInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Añadir elemento'),
      ),
      body: Builder(
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: itemInput,
                  decoration: const InputDecoration(
                    labelText: 'Introduzca un elemento',
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancelar'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String? selectedItem =
                            BlocProvider.of<ItemsCubit>(context)
                                .state
                                .selectedItem;
                        BlocProvider.of<ItemsCubit>(context)
                            .addItem(itemInput.text, selectedItem!);
                        debugPrint(
                            'Elemento añadido! Lista actualizada: ${BlocProvider.of<ItemsCubit>(context).state.items!.toString()}');
                        Navigator.pop(context);
                      },
                      child: const Text('Añadir'),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
