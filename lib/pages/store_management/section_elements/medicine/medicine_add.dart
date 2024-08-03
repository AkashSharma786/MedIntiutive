import 'package:flutter/material.dart';

class MedicineAdd extends StatelessWidget {

  const MedicineAdd({super.key});

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
          ElevatedButton(child: const Text("Select Medicine"), onPressed: (){} ),
        ],
      )

    );
  }
}