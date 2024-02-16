class SelectedData {
  static final SelectedData _selectedData = SelectedData._internal();

  String selected = "";

  factory SelectedData() {
    return _selectedData;
  }

  SelectedData._internal();
}

final selectedData = SelectedData();
