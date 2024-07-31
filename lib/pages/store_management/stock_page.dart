import 'package:flutter/material.dart';

class StockPage extends StatefulWidget {
  const StockPage({super.key});

  @override
  State<StockPage> createState() => StockPageState();
}

class StockPageState extends State<StockPage> {
  int currentClickedButton = 0;
  void updateColumn(int num) {
    setState(() {
      currentClickedButton = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          width: screenSize.width,
          height: 50,
          color: Colors.amber,
          child: Text(
            "$currentClickedButton",
          ),
        ),
        Container(
          width: screenSize.width,
          height: screenSize.height - 160,
          color: Colors.teal,
          child: Text(
            "Stock Page",
          ),
        )
      ],
    );
  }
}
