import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:software_practica_cubit/bloc/items_state.dart';

// esta clase almacena el estado y declara los métodos que lo modifican
class ItemsCubit extends Cubit<ItemsState> {
  ItemsCubit()
      : super(ItemsState(
            items: ['a', 'b', 'c'],
            selectedItem: 'a')); // estado inicial, valores iniciales

  void selectItem(String? selectedItem) {
    List<String>? items = state.items;
    emit(ItemsState(
      items: items,
      selectedItem: selectedItem,
    ));
  }

  void addItem(String newItem, String selectedItem) {
    List<String>? items = state.items;
    items?.add(newItem);
    emit(ItemsState(
      items: items,
      selectedItem: newItem,
    ));
  }

  void editItem(String updatedItem, String selectedItem) {
    List<String>? items = state.items;
    for (int i = 0; i < items!.length; i++) {
      if (items[i] == selectedItem) {
        items[i] = updatedItem;
        break;
      }
    }
    emit(ItemsState(
      items: items,
      selectedItem: updatedItem,
    ));
  }

  void deleteItem(String selectedItem) {
    List<String>? items = state.items;
    for (int i = 0; i < items!.length; i++) {
      if (items[i] == selectedItem) {
        items.removeAt(i);
        break;
      }
    }
    emit(ItemsState(
      items: items,
      selectedItem: items.isNotEmpty ? items[0] : '',
    ));
  }
}
