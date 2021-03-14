part of 'toan_cubit.dart';

@immutable
abstract class ToanState {
  final int counterValue;
  ToanState(this.counterValue);
}

class ToanInitial extends ToanState {
  ToanInitial(int counterValue) : super(counterValue);
}
