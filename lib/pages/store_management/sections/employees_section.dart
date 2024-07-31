import 'package:flutter/material.dart';

class EmployeesSection extends StatefulWidget {

  const EmployeesSection({super.key});

  @override
  State<EmployeesSection> createState() => _EmployeesSectionState();
}

class _EmployeesSectionState extends State<EmployeesSection> {
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
          OutlinedButton(onPressed: (){}, child: Text('Add Employee')),
          OutlinedButton(onPressed: (){}, child: Text('View Employees')),
          OutlinedButton(onPressed: (){}, child: Text('Edit Employees')),
          OutlinedButton(onPressed: (){}, child: Text('Delete Employees')),
          
           
           
          
        ],
      ),

    ) ;
  }
}