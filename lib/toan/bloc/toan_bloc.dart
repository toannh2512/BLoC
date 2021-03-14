import 'package:flutter_bloc/flutter_bloc.dart';
part 'toan_event.dart';
part 'toan_state.dart';

class ToanBloc extends Bloc<ToanEvent, int> {
  ToanBloc() : super(0);

  @override
  Stream<int> mapEventToState(
    ToanEvent event,
  ) async* {
    switch (event) {
      case ToanEvent.decrement:
        yield state - 1;
        break;
      case ToanEvent.increment:
        yield state + 1;
        break;
      default:
        addError(Exception('unsupported event'));
    }
  }
}
