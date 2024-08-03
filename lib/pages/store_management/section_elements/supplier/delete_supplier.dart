import 'package:flutter/material.dart';


class DeleteSupplier extends StatelessWidget {

  const DeleteSupplier({super.key});

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