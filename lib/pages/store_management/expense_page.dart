import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/expense/expense_by_date.dart';

class ExpensePage extends StatefulWidget {
  const ExpensePage({super.key});

  @override
  State<ExpensePage> createState() => ExpensePageState();
}

class ExpensePageState extends State<ExpensePage> {
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
              case 4:
                return ExpenseByDate();
                
                default :
                return SizedBox();

            }
          }
          ),




            

        


        Expanded(
          child: Container(
            width: screenSize.width,
            
            color: Colors.cyan,
            child: Text(
              "Expense Page",
            ),
          ),
        )



      ],
    );
  }
}
