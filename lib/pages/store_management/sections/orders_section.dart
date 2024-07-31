import 'package:flutter/material.dart';

class OrdersSection extends StatefulWidget {
  ValueSetter<int> whichButtonClicked;

  OrdersSection({super.key, required this.whichButtonClicked});

  @override
  State<OrdersSection> createState() => _OrdersSectionState();
}

class _OrdersSectionState extends State<OrdersSection> {
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
              child: Text('New Order')),
          OutlinedButton(
              onPressed: () {
                widget.whichButtonClicked(2);
              },
              child: Text('View')),
          OutlinedButton(
              onPressed: () {
                widget.whichButtonClicked(3);
              },
              child: Text('Cancel Orders')),
        ],
      ),
    );
  }
}
