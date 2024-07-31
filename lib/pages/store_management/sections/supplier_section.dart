import 'package:flutter/material.dart';

class SupplierSection extends StatefulWidget {
  ValueSetter<int> whichButtonClicked;

  SupplierSection({super.key, required this.whichButtonClicked});

  @override
  State<SupplierSection> createState() => _SupplierSectionState();
}

class _SupplierSectionState extends State<SupplierSection> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 40,
      width: screenSize.width,
      color: Colors.cyan,
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
              child: Text('Delete ')),
          OutlinedButton(
              onPressed: () {
                widget.whichButtonClicked(4);
              },
              child: Text('View')),
        ],
      ),
    );
  }
}
