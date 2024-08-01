import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MedicineDelete extends StatelessWidget {

  MedicineDelete({super.key});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Container(

      width: screenSize.width,
      height: 50,
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(child: Text("Select Medicine "), onPressed: (){} ),
        ],
      ),


    );
  }
}