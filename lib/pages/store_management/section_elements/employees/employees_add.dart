import 'package:flutter/material.dart';

class EmployeesAdd extends StatelessWidget {

  const EmployeesAdd({super.key});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Container(

      width: screenSize.width * 0.4,
      height: screenSize.height*0.9,
      color: Colors.amber,
      child: const Text("Add Employee"),


    );
  }
}