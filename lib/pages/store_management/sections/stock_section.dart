import 'package:flutter/material.dart';

class StockSection extends StatefulWidget {

  const StockSection({super.key});

  @override
  State<StockSection> createState() => _StockSectionState();
}

class _StockSectionState extends State<StockSection> {
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
          OutlinedButton(onPressed: (){}, child: Text('Stock Ascending')),
          OutlinedButton(onPressed: (){}, child: Text('View Desending')),
          OutlinedButton(onPressed: (){}, child: Text('Expiry Ascending ')),
          OutlinedButton(onPressed: (){}, child: Text('Expiry Descending')),
          
           
           
          
        ],
      ),

    ) ;
  }
}