import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCubit extends Cubit<List<String>> {
  ItemCubit(super.initialState);

  // almacena el estado y declara los métodos
  // ItemCubit() : super([]);

  void addItem(String item) {
    final updatedItems = List<String>.from(state);
    updatedItems.add(item);
    emit(updatedItems);
  }

  void editItem(String item, int index) {
    final updatedItems = List<String>.from(state);
    updatedItems[index] = item;
    emit(updatedItems);
  }

  void deleteItem(int index) {
    final updatedItems = List<String>.from(state);
    updatedItems.removeAt(index);
    emit(updatedItems);
  }
}
