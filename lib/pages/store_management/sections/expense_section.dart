import 'package:flutter/material.dart';

class ExpenseSection extends StatefulWidget {
  ValueSetter<int> whichButtonClicked;

  ExpenseSection({super.key, required this.whichButtonClicked});

  @override
  State<ExpenseSection> createState() => _ExpenseSectionState();
}

class _ExpenseSectionState extends State<ExpenseSection> {
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
              child: Text('One Month')),
          OutlinedButton(
              onPressed: () {
                widget.whichButtonClicked(2);
              },
              child: Text('Six Monts')),
          OutlinedButton(
              onPressed: () {
                widget.whichButtonClicked(3);
              },
              child: Text('One Year')),
          OutlinedButton(
              onPressed: () {
                widget.whichButtonClicked(4);
              },
              child: Text('Select by Date')),
        ],
      ),
    );
  }
}
