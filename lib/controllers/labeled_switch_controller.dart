//TODO: Transformar isso em mobx posteriormente

class LabeledSwitchController {
  bool value;

  LabeledSwitchController({this.value = false});

  void changeValue(bool newValue) {
    value = newValue;
  }
}