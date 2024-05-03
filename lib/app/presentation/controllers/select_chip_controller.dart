class SelectChipController {
  List<bool> isSelectedList = [false, false, false];

  bool getSelectedChip(int index) => isSelectedList[index];

  void setChipValue(int index, bool value) => isSelectedList[index] = value;
}
