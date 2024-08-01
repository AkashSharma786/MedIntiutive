import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EmployeesAdd extends StatelessWidget {

  EmployeesAdd({super.key});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Container(

      width: screenSize.width * 0.4,
      height: screenSize.height*0.9,
      color: Colors.amber,
      child: Text("Add Employee"),


    );
  }
}