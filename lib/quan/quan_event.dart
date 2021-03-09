abstract class QuanEvent {
  num increment;
}

class IncreaseNumber extends QuanEvent {
  //Event to help user increase number
  IncreaseNumber(this.increment);
  final int increment;
}
