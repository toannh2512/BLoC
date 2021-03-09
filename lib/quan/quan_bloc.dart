import 'dart:async';
import 'quan_event.dart';
import 'quan_state.dart';

class QuanBloc {
  var num = QuanState(0);
  //Create 2 controller
  //A controller to receive event from UI
  final evController = StreamController<QuanEvent>();

  //A controller manage state, transfer state to UI
  final stController = StreamController<QuanState>();

  QuanBloc() {
    //Listen when the evController push new event
    evController.stream.listen((QuanEvent event) {
      num = QuanState(num.number + event.increment);

      //Add new state for UI can receive info
      stController.sink.add(num);
    });
  }

  // When we no need we will close all controller
  void dispose() {
    stController.close();
    evController.close();
  }
}
