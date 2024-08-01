import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/material_styles/date_input.dart';

class ExpenseByDate extends StatelessWidget {
  TextEditingController fromDayController = TextEditingController();
  TextEditingController fromMonthController = TextEditingController();
  TextEditingController fromYearController = TextEditingController();
  TextEditingController toDayController = TextEditingController();
  TextEditingController toMonthController = TextEditingController();
  TextEditingController toYearController = TextEditingController();
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
          
          DateInput( dayControl: fromDayController, monthControl: fromMonthController, yearControl: fromYearController),

          Text("to:  "),
          DateInput( dayControl: toDayController, monthControl: toMonthController, yearControl: toYearController),
         
          
          ElevatedButton(onPressed: () {
            print(" from ${fromDayController.text}/${fromMonthController.text}/${fromYearController.text}");
            print(" to ${toDayController.text}/${toMonthController.text}/${toYearController.text}");
          }, child: const Text("Evaluate"))
        ],
      ),
    );
  }
}
