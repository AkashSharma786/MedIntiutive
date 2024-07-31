import 'package:flutter/material.dart';

class StockSection extends StatefulWidget {
  ValueSetter<int> whichButtonClicked;

  StockSection({super.key, required this.whichButtonClicked});

  @override
  State<StockSection> createState() => _StockSectionState();
}

class _StockSectionState extends State<StockSection> {
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
              child: Text('Stock Ascending')),
          OutlinedButton(
              onPressed: () {
                widget.whichButtonClicked(2);
              },
              child: Text('Stock Desending')),
          OutlinedButton(
              onPressed: () {
                widget.whichButtonClicked(3);
              },
              child: Text('Expiry Ascending ')),
          OutlinedButton(
              onPressed: () {
                widget.whichButtonClicked(4);
              },
              child: Text('Expiry Descending')),
        ],
      ),
    );
  }
}
