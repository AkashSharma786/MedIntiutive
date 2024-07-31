import 'package:flutter/material.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => ExpensePageState();
}

class ExpensePageState extends State<ExpensePage> {
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
          color: const Color.fromARGB(255, 209, 219, 228),
          child: Text(
            "$currentClickedButton",
          ),
        ),
        Container(
          width: screenSize.width,
          height: screenSize.height - 146,
          color: Colors.cyan,
          child: Text(
            "Expense Page",
          ),
        )
      ],
    );
  }
}
