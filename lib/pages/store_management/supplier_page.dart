import 'package:flutter/material.dart';

class SupplierPage extends StatefulWidget {
  const SupplierPage({super.key});

  @override
  State<SupplierPage> createState() => SupplierPageState();
}

class SupplierPageState extends State<SupplierPage> {
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
          color: Colors.green,
          child: Text(
            "$currentClickedButton",
          ),
        ),
        Container(
          width: screenSize.width,
          height: screenSize.height - 146,
          color: Colors.yellow,
          child: Text(
            "Supplier Page",
          ),
        )
      ],
    );
  }
}
