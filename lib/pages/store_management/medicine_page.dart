import 'package:flutter/material.dart';

class MedicinePage extends StatefulWidget {
  //int  whichButtonClicked;

  MedicinePage({super.key});

  @override
  State<MedicinePage> createState() => MedicinePageState();
}

class MedicinePageState extends State<MedicinePage> {
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
          color: Colors.orange,
          child: Text(
            "$currentClickedButton",
          ),
        ),
        Container(
          width: screenSize.width,
          height: screenSize.height - 146,
          color: Colors.purple,
          child: Text(
            "Medicine Page",
          ),
        )
      ],
    );
  }
}
