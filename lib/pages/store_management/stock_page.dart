import 'package:flutter/material.dart';

class StockPage extends StatefulWidget {

  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
  
}

class _StockPageState extends State<StockPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(

      children: [

        Container(
          width: screenSize.width,
          height: 50,
          color: Colors.amber,
        ),

        Container(
          width: screenSize.width,
          height: screenSize.height-160,
          color: Colors.teal,
          child: Text("Stock Page",),
        )


      ],


    );
      

    
  }
}