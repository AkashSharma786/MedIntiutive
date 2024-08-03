import 'package:flutter/material.dart';

class EmployeesDelete extends StatelessWidget {

  const EmployeesDelete({super.key});

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
          ElevatedButton(child: const Text("Select Employee"), onPressed: (){} ),
        ],
      )
,


    );
  }
}