import "package:mobx/mobx.dart";

class Controller {
  Observable<int> numeroDeClicks = Observable(0);

  _addClick() {
    numeroDeClicks.value++;
  }

  late Action addClick;

  Controller() {
    addClick = Action(_addClick);
  }
}
