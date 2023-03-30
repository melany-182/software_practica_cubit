import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:software_practica_cubit/bloc/items_state.dart';

class ItemsCubit extends Cubit<ItemsState> {
  // almacena el estado y declara los métodos
  ItemsCubit()
      : super(ItemsState(
            ['a', 'b', 'c'], 'a')); // estado inicial, valores iniciales

  void selectItem(List<String> items, String? selectedItem) {
    final newState = state.copyWith(items: items, selectedItem: selectedItem);
    emit(newState);
  }

  void addItem(List<String> items, String newItem, String selectedItem) {
    final newItemsList = List<String>.from(items)..add(newItem);
    final newState =
        state.copyWith(items: newItemsList, selectedItem: selectedItem);
    emit(newState);
  }

  void editItem(
      List<String> items, int index, String newItem, String selectedItem) {
    items[index] = newItem;
    emit(ItemsState(
      items,
      selectedItem,
    ));
  }

  void deleteItem(List<String> items, String selectedItem) {
    final index = items.indexOf(selectedItem);
    items.removeAt(index);
    emit(ItemsState(
      items,
      items.isNotEmpty ? items[0] : null,
    ));
  }
}
