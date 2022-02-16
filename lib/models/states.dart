class StateList<String> {
  bool isSelected = false;
  late String stateNumber;
  late String stateName;
  StateList(this.stateName, this.stateNumber);
  getStateNumber() {
    return stateNumber;
  }
}
