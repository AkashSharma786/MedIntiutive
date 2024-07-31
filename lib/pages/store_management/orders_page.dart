import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {

  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => _OrdersPageState();
  
}

class _OrdersPageState extends State<OrdersPage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(

      children: [

        Container(
          width: screenSize.width,
          height: 50,
          color: Colors.deepPurple,
        ),

        Container(
          width: screenSize.width,
          height: screenSize.height-160,
          color: Colors.pink,
          child: Text("Orders Page",),
        )


      ],


    );
      

    
  }
}