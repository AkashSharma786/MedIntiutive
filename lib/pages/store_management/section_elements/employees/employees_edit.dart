import 'package:flutter/material.dart';

class EmployeesEdit extends StatelessWidget {

  const EmployeesEdit({super.key});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Container(

      width: screenSize.width,
      height: 50,
      color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(child: const Text("Edit Employee"), onPressed: (){} ),
        ],
      )
,


    );
  }
}