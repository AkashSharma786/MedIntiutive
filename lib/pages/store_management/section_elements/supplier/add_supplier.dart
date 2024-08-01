import 'package:flutter/material.dart';


class AddSupplier extends StatelessWidget {

  AddSupplier({super.key});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Container(
    
      width: screenSize.width*0.4,
      height: screenSize.height*0.9,
      
    
      color: Colors.green,
      child: Text("Add Supplier"),
    
    
    );
  }
}