import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {

  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => OrdersPageState();
  
}

class OrdersPageState extends State<OrdersPage> {

  int currentClickedButton = 0;
  void updateColumn(int num)
  {
    setState(() {
      currentClickedButton = num;
    });
    
  
  }
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(

      children: [

        Container(
          width: screenSize.width,
          height: 50,
          color: Colors.deepPurple,
          child: Text("$currentClickedButton",),
        ),

        Container(
          width: screenSize.width,
          height: screenSize.height-146,
          color: Colors.pink,
          child: Text("Orders Page",),
        )


      ],


    );
      

    
  }
}