import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/material_styles/custom_labeled_text_field.dart';

class MedicineDelete extends StatelessWidget {
   TextEditingController serialController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController sciNameController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController typeController = TextEditingController();

  MedicineDelete({super.key});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Container(

      width: screenSize.width * 0.3,
      height: screenSize.height*0.9,
      color: Colors.blue,
      child: Row(
        children: [

          SizedBox(
            width: screenSize.width * 0.02,),
            
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomLabeledTextField(label: "Serial Number", hint: "2", widgetControl: serialController),
              CustomLabeledTextField(label: "Common Name", hint: "Dolo 650", widgetControl: nameController),
              CustomLabeledTextField(label: "Scientific Name", hint: "Paracenatom 650 mg", widgetControl: sciNameController),
              CustomLabeledTextField(label: "Brand", hint: "Cipla", widgetControl: brandController),
              CustomLabeledTextField(label: "Type", hint: "tablet", widgetControl: typeController),

              ElevatedButton(onPressed: (){

                print("Serial Number : ${serialController.text}");
                print("Common Name : ${nameController.text}");
                print("Scientific Name : ${sciNameController.text}");
                print("Brand : ${brandController.text}");
                print("Type : ${typeController.text}");
              }, child: Text("Search & Delete")),
              SizedBox(height: 50),


            ],
            
            
            ),
        ],
      ),


    );
  }
}