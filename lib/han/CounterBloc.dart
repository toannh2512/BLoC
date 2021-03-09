import 'package:bloc/bloc.dart';
import 'CounterEvent.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc(int initialState) : super(initialState);

  @override
  Stream<int> mapEventToState(event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield this.state + 1;
        break;
      case CounterEvent.decrement:
        yield this.state - 1;
        break;
    }
    throw UnimplementedError();
  }
}
