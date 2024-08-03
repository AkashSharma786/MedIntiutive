import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {

  List<Map<String, Object?>> selectedMedicinesList = [];
  void getSelectedMedicines(List<Map<String, Object?>> data){
    selectedMedicinesList = data;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      // Your widget code here
    );
  }
}