import 'package:flutter/material.dart';

class OrdersSection extends StatefulWidget {

  const OrdersSection({super.key});

  @override
  State<OrdersSection> createState() => _OrdersSectionState();
}

class _OrdersSectionState extends State<OrdersSection> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 40,
      width: screenSize.width,
      color: Colors.cyan,
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedButton(onPressed: (){}, child: Text('New Order')),
         
          OutlinedButton(onPressed: (){}, child: Text('View')),
          OutlinedButton(onPressed: (){}, child: Text('Cancel Orders')),
          
           
           
          
        ],
      ),

    ) ;
  }
}