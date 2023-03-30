import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:software_practica_cubit/bloc/items_cubit.dart';

class AddPage extends StatelessWidget {
  // final ItemsCubit itemCubit;
  AddPage({
    Key? key,
  }) : super(key: key);

  final itemInput = TextEditingController();

  void dispose() {
    itemInput.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final itemsCubit = BlocProvider.of<ItemsCubit>(context);

    return BlocProvider(
        create: (context) => ItemsCubit(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Añadir elemento'),
          ),
          body: Builder(builder: (context) {
            return Container(
              padding: const EdgeInsets.all(25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextField(
                    controller: itemInput,
                    decoration: const InputDecoration(
                      icon: Icon(Icons.calendar_today),
                      labelText: 'Introduzca un elemento',
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('Cancelar'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          List<String>? items =
                              BlocProvider.of<ItemsCubit>(context).state.items;
                          String? selectedItem =
                              BlocProvider.of<ItemsCubit>(context)
                                  .state
                                  .selectedItem;
                          BlocProvider.of<ItemsCubit>(context).addItem(
                              //items, itemInput.toString(), selectedItem!);
                              items!,
                              itemInput.text,
                              selectedItem!);

                          Navigator.pop(context);
                        },
                        child: const Text('Añadir'),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
        ));
  }
}
