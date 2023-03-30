import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class CounterCubit extends Cubit<int> {
  // almacena el estado y declara los métodos
  CounterCubit() : super(0);

  void increment() => emit(state + 1);

  void random() async {
    var rnd = Random();
    while (true) {
      await Future.delayed(Duration(seconds: 1));
      // Generar número aleatorio entre 0 y 100
      emit(rnd.nextInt(100));
    }
  }
}
