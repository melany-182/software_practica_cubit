import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:software_practica_cubit/bloc/items_cubit.dart';
import 'package:software_practica_cubit/bloc/items_state.dart';
import 'package:software_practica_cubit/ui/add_page.dart';
import 'package:software_practica_cubit/ui/edit_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Práctica Cubit'),
      ),
      body: Builder(
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                BlocBuilder<ItemsCubit, ItemsState>(
                  builder: (context, state) {
                    String? selectedItem = state.selectedItem;
                    return DropdownButton<String>(
                      hint: const Text('Seleccionar elemento'),
                      value: state.items!.isNotEmpty ? selectedItem : null,
                      onChanged: (newValue) {
                        BlocProvider.of<ItemsCubit>(context)
                            .selectItem(newValue);
                      },
                      focusColor: Colors.white,
                      items: state.items!
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    );
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddPage(),
                          ),
                        );
                      },
                      child: const Text('Añadir'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (BlocProvider.of<ItemsCubit>(context)
                            .state
                            .items!
                            .isNotEmpty) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditPage(),
                            ),
                          );
                        }
                      },
                      child: const Text('Editar'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (BlocProvider.of<ItemsCubit>(context)
                            .state
                            .items!
                            .isNotEmpty) {
                          String? selectedItem =
                              BlocProvider.of<ItemsCubit>(context)
                                  .state
                                  .selectedItem;
                          BlocProvider.of<ItemsCubit>(context)
                              .deleteItem(selectedItem!);
                          debugPrint(
                              'Elemento eliminado! Lista actualizada: ${BlocProvider.of<ItemsCubit>(context).state.items!.toString()}');
                        }
                      },
                      child: const Text('Eliminar'),
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
