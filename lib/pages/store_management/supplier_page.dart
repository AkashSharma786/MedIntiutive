import 'package:flutter/material.dart';

class SupplierPage extends StatefulWidget {

  const SupplierPage({super.key});

  @override
  State<SupplierPage> createState() => _SupplierPageState();
  
}

class _SupplierPageState extends State<SupplierPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(

      children: [

        Container(
          width: screenSize.width,
          height: 50,
          color: Colors.green,
        ),

        Container(
          width: screenSize.width,
          height: screenSize.height-160,
          color: Colors.yellow,
          child: Text("Supplier Page",),
        )


      ],


    );
      

    
  }
}