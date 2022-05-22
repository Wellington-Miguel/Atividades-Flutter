import 'package:mobx/mobx.dart';

class ControllerPage {
  final _page = Observable(0);
  int get page => _page.value;
  set page(newValue) => _page.value = newValue;

  late Action increment;
  late Action decrement;
  ControllerPage() {
    increment = Action(_increment);
    decrement = Action(_decrement);
  }

  _decrement() {
    _page.value--;
  }

  _increment() {
    _page.value++;
  }
}
