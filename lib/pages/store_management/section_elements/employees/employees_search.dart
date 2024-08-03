import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/material_styles/custom_labeled_text_field.dart';

class EmployeesSearch extends StatelessWidget {

  TextEditingController id;
  TextEditingController firstName;
  TextEditingController lastName;
  VoidCallback search;


  EmployeesSearch({super.key,
  required this.id,
  required this.firstName,
  required this.lastName,
  required this.search

  
  });

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Container(

  
      color: Colors.amber,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [CustomLabeledTextField(label: "id", hint: "25", widgetControl: id),
        CustomLabeledTextField(label: "first name", hint: "Akash", widgetControl: firstName),
        CustomLabeledTextField(label: "last name", hint: "Sharma", widgetControl: lastName),


          ElevatedButton(child: Text("Search"), onPressed: (){ search();} ),
        ],
      )
,


    );
  }
}