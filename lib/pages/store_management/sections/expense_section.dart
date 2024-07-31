import 'package:flutter/material.dart';

class ExpenseSection extends StatefulWidget {

  const ExpenseSection({super.key});

  @override
  State<ExpenseSection> createState() => _ExpenseSectionState();
}

class _ExpenseSectionState extends State<ExpenseSection> {
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
          OutlinedButton(onPressed: (){}, child: Text('One Month')),
          OutlinedButton(onPressed: (){}, child: Text('Six Monts')),
          OutlinedButton(onPressed: (){}, child: Text('One Year')),
          OutlinedButton(onPressed: (){}, child: Text('Select by Date')),
          
           
           
          
        ],
      ),

    ) ;
  }
}