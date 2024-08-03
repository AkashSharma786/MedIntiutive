import 'package:flutter/material.dart';
import 'package:flutter_application_1/material_styles/custom_labeled_text_field.dart';

class MedicineSearch extends StatelessWidget {
  
  TextEditingController serialController;
  TextEditingController nameController;
  TextEditingController sciNameController;
  VoidCallback search;

  MedicineSearch(
      {super.key,
      required this.serialController,
      required this.nameController,
      required this.sciNameController,
      required this.search
      });

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width,
      height: screenSize.height*0.1,
      color: Colors.blue,
      child: Row(
     
        children: [

          CustomLabeledTextField(
              label: "Serial Number",
              hint: "2",
              widgetControl: serialController),
              
          CustomLabeledTextField(
              label: "Common Name",
              hint: "Dolo 650",
              widgetControl: nameController),
          CustomLabeledTextField(
              label: "Scientific Name",
              hint: "Paracenatom 650 mg",
              widgetControl: sciNameController),
          ElevatedButton(
              onPressed: () => search(),
              child: const Text("Search")),
        ],
      ),
    );
  }
}
