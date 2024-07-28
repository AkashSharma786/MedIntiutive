import 'package:flutter/material.dart';
import 'package:flutter_application_1/material_styles/button.dart';

class BillEntry extends StatefulWidget {

  final int serialNumber;
  final String itemName;
  final double price;
  final int quantity;
  final double total;

  const BillEntry({Key? key , 
  required this.serialNumber,
  required this.itemName,
  required this.price,
  required this.quantity,
  required this.total,

  }) ;

  @override
  State<BillEntry> createState() => _BillEntryState();
}

class _BillEntryState extends State<BillEntry> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth*0.9,
      height: screenHeight*0.05,
      color: Colors.white,
    child: Row(
      children: [
        SizedBox(
          width: screenHeight*0.1,
        ),

        Container(
          width: screenWidth * 0.1,
          child: Text(widget.serialNumber.toString()),
        ),
        Container(
          width: screenWidth * 0.2,
          child: Text(widget.itemName),
        ),
        Container(
          width: screenWidth * 0.2,
          child: Text(widget.price.toString()),
        ),
        Container(
          width: screenWidth * 0.1,
          child: Text(widget.quantity.toString()),
        ),
        Container(
          width: screenWidth * 0.1,
          child: Text(widget.total.toString()),
        ),

        MyButtonStyle(text: "Remove", width: screenWidth*0.1, height: screenHeight*0.04, onTap: (){})
      ],
    ),
    
    

      // Add your widget code here
    );
  }
}