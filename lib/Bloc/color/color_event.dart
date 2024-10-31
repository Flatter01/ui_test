abstract class ColorEvent {
  ColorEvent();
}

class PickStatusEvent extends ColorEvent {
  final int index;

  PickStatusEvent({required this.index});
}
