import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'toan_state.dart';

class ToanCubit extends Cubit<ToanState> {
  ToanCubit() : super(ToanInitial(0));
  void increment() => emit(ToanInitial(state.counterValue + 1));
  void decrement() => emit(ToanInitial(state.counterValue - 1));
}
