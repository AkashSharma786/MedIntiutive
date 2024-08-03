import 'package:flutter/material.dart';


class EditSupplier extends StatelessWidget {

  const EditSupplier({super.key});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Container(

      width: screenSize.width,
      height: 50,
      color: Colors.green,
      child: Center(
        child: ElevatedButton(
          onPressed: (){},
           child: const Text("Select Supplier"),
           ),
      ),


    );
  }
}