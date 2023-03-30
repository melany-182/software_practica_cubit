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
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<ItemsCubit, ItemsState>(
              builder: (context, state) {
                String? selectedItem = state.selectedItem;
                return DropdownButton<String>(
                  hint: const Text('Selecciona un elemento'),
                  value: state.items.isNotEmpty ? selectedItem : null,
                  onChanged: (newValue) {
                    BlocProvider.of<ItemsCubit>(context)
                        .selectItem(state.items, newValue);
                    debugPrint('${BlocProvider.of<ItemsCubit>(context).state}');
                  },
                  focusColor: Colors.white,
                  items:
                      state.items.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddPage(
                            itemCubit: BlocProvider.of<ItemsCubit>(context)),
                      ),
                    );
                  },
                  child: const Text('Añadir'),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (BlocProvider.of<ItemsCubit>(context)
                        .state
                        .items
                        .isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditPage(
                            item: BlocProvider.of<ItemsCubit>(context)
                                .state
                                .items[0],
                            index: 0,
                          ),
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
                        .items
                        .isNotEmpty) {
                      final items =
                          BlocProvider.of<ItemsCubit>(context).state.items;
                      final selectedItem = BlocProvider.of<ItemsCubit>(context)
                          .state
                          .selectedItem;
                      BlocProvider.of<ItemsCubit>(context).deleteItem(
                          items, items.indexOf(selectedItem!), selectedItem);
                    }
                  },
                  child: const Text('Eliminar'),
                ),
              ],
            ),
          ],
        )));
  }
}
