import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:software_practica_cubit/bloc/items_cubit.dart';

class EditPage extends StatelessWidget {
  EditPage({Key? key}) : super(key: key);

  final updatedItemInput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editar elemento'),
      ),
      body: Builder(
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: updatedItemInput,
                  decoration: const InputDecoration(
                    hintText: 'Introduzca el nuevo valor del elemento',
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
                            .editItem(updatedItemInput.text, selectedItem!);
                        debugPrint(
                            'Elemento editado! Lista actualizada: ${BlocProvider.of<ItemsCubit>(context).state.items!.toString()}');
                        Navigator.pop(context);
                      },
                      child: const Text('Editar'),
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
