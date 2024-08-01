import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/employees/employees_add.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/employees/employees_delete.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/employees/employees_edit.dart';

class EmployeesPage extends StatefulWidget {
  EmployeesPage({super.key});

  @override
  State<EmployeesPage> createState() => EmployeesPageState();
}

class EmployeesPageState extends State<EmployeesPage> {
  int currentClickedButton = 0;
  void updateColumn(int num) {
    setState(() {
      currentClickedButton = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Builder(builder: (context){
     switch(currentClickedButton){
       case 1:
         return Row(
           children: [
             EmployeesAdd(),
             
           ],
         );
       case 2:
         return Column(
           children: [
             EmployeesEdit(),
             Expanded(
          child: Container(
            width: screenSize.width,
            
            color: Colors.red,
          ),
        )
           ],
         );
       case 3:
         return Column(
           children: [
             EmployeesDelete(),
             Expanded(
          child: Container(
            width: screenSize.width,
            
            color: Colors.red,
          ),
        )
           ],
         );
       default: 
       return  Expanded(
          child: Container(
            width: screenSize.width,
            
            color: Colors.red,
          ),
        );
       }
    });
  }
}
