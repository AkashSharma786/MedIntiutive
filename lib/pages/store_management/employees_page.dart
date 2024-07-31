import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class EmployeesPage extends StatefulWidget {
  EmployeesPage({super.key});

  @override
  State<EmployeesPage> createState() => EmployeesPageState();
}

class EmployeesPageState extends State<EmployeesPage> {
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
              color: Colors.blue,
              child: Text(
                "$currentClickedButton",
              ),
            ),
          
        
        Container(
          width: screenSize.width,
          height: screenSize.height - 146,
          color: Colors.red,
        )
      ],
    );
  }
}
