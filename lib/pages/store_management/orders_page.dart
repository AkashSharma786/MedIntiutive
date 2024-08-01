import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/orders/cancel_order.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/orders/modify_order.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/orders/new_order.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => OrdersPageState();
}

class OrdersPageState extends State<OrdersPage> {
  int currentClickedButton = 0;
  void updateColumn(int num) {
    setState(() {
      currentClickedButton = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [


        Builder(builder: (context){
            switch(currentClickedButton){
              case 1:
                return NewOrder();
              case 2:
                return ModifyOrder();
              case 3:
                return CancelOrder();
              default: 
              return const SizedBox();
              }
           }),



        Expanded(
          child: Container(
            width: screenSize.width,
           
            color: Colors.pink,
            child: Text(
              "Orders Page",
            ),
          ),
        )
      ],
    );
  }
}
