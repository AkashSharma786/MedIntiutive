import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/material_styles/date_input.dart';

class ExpenseByDate extends StatelessWidget {
  ExpenseByDate({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: 50,
      //color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        
        children: [
          Text("From:  "),
          
          DateInput(),

          Text("to:  "),
          DateInput(),
         
          
          ElevatedButton(onPressed: () {}, child: const Text("Evaluate"))
        ],
      ),
    );
  }
}
