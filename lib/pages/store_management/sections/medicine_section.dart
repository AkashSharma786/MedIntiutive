import 'package:flutter/material.dart';

class MedicineSection extends StatefulWidget {
  ValueSetter<int> whichButtonClicked;

  MedicineSection({super.key, required this.whichButtonClicked});

  @override
  State<MedicineSection> createState() => _MedicineSectionState();
}

class _MedicineSectionState extends State<MedicineSection> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 40,
      width: screenSize.width,
      color: Colors.white,
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedButton(
              onPressed: () {
                widget.whichButtonClicked(1);
              },
              child: Text('Search')),
          OutlinedButton(
              onPressed: () {
                widget.whichButtonClicked(2);
              },
              child: Text('Add')),
          OutlinedButton(
              onPressed: () {
                widget.whichButtonClicked(3);
              },
              child: Text('Delete')),
          
        ],
      ),
    );
  }
}
