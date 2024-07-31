import 'package:flutter/material.dart';

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
                return Container(
                  width: screenSize.width,
                  height: 50,
                  color: Colors.deepPurple,
                  child: Text(
                    "Expense Page",
                  ),
                );
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
