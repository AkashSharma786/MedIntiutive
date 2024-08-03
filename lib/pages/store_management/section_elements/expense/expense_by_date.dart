import 'package:flutter/material.dart';
import 'package:flutter_application_1/material_styles/date_input.dart';

class ExpenseByDate extends StatelessWidget {
  const ExpenseByDate({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: screenSize.width,
      height: 50,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          const Text("From:  "),
          
          const DateInput(),

          const Text("to:  "),
          const DateInput(),
         
          
          ElevatedButton(onPressed: () {}, child: const Text("Evaluate"))
        ],
      ),
    );
  }
}
