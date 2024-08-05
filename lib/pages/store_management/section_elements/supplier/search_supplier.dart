import 'package:flutter/material.dart';
import 'package:flutter_application_1/material_styles/custom_labeled_text_field.dart';

class SearchSupplier extends StatelessWidget {
  
  TextEditingController idController;
  TextEditingController nameController;
  TextEditingController emailController;
  VoidCallback search;

  SearchSupplier(
      {super.key,
      required this.idController,
      required this.nameController,
      required this.emailController,
      required this.search
      });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: screenSize.height*0.1,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
     
        children: [

          CustomLabeledTextField(
              label: "id",
              hint: "23",
              widgetControl: idController),
              
          CustomLabeledTextField(
              label: "Supplier Name",
              hint: "Harih Rao",
              widgetControl: nameController),
          CustomLabeledTextField(
              label: "email",
              hint: "someone@mail.com",
              widgetControl: emailController),
          ElevatedButton(
              onPressed: () { search();},
              child: const Text("Search")),
        ],
      ),
    );
  }
}
