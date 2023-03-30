import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:software_practica_cubit/bloc/item_cubit.dart';
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
            // BlocBuilder es el que escucha al stream
            BlocBuilder<ItemCubit, List<String>>(
              builder: (context, state) {
                return DropdownButton<String>(
                  hint: const Text('Selecciona un elemento'),
                  value: state.isEmpty ? null : state[0],
                  onChanged: (_) {},
                  items: state.map<DropdownMenuItem<String>>((String value) {
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
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AddPage(itemCubit: context.read<ItemCubit>()),
                      ),
                    );
                  },
                  child: const Text('Añadir'),
                ),
                TextButton(
                  onPressed: () {
                    if (context.read<ItemCubit>().state.isNotEmpty) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditPage(
                            item: context.read<ItemCubit>().state[0],
                            index: 0,
                          ),
                        ),
                      );
                    }
                  },
                  child: const Text('Editar'),
                ),
                TextButton(
                  onPressed: () {
                    context.read<ItemCubit>().deleteItem(0);
                  },
                  child: const Text('Eliminar'),
                ),
              ],
            ),
          ],
        )));
  }
}
