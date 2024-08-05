import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/database_service.dart';
import 'package:flutter_application_1/material_styles/custom_labeled_text_field.dart';
import 'package:flutter_application_1/material_styles/date_input.dart';

class AddSupplier extends StatelessWidget {

  TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final VoidCallback refresh;


  AddSupplier({super.key , required this.refresh,});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
    List<String> supplierFields = DatabaseService.supplierFields;

    return Container(

      width: screenSize.width*0.3,
      height: screenSize.height*0.9,
      color: Colors.blue,
      child: Row(
        children: [

          SizedBox(
            width: screenSize.width * 0.02,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomLabeledTextField(label: "id", hint: "56", widgetControl: idController),
              CustomLabeledTextField(label: "Name", hint: "Remedy Medicines ltd", widgetControl: nameController),
              SizedBox(height: screenSize.height*0.02,),

               CustomLabeledTextField(label: "Phone", hint: "1230456789", widgetControl: phoneController),
              SizedBox(height: screenSize.height*0.02,),
              CustomLabeledTextField(label: "email" , hint: "somone@email.com", widgetControl: emailController),
              SizedBox(height: screenSize.height*0.02,),
              CustomLabeledTextField(label: "Address", hint: "this road, thsi building , this city", widgetControl: addressController),
              SizedBox(height: screenSize.height*0.02,),
             

             

              ElevatedButton(onPressed: (){
              
                DatabaseService.addItems( DatabaseService.tableName[2],{
                  DatabaseService.supplierFields[0] : int.tryParse(idController.text),
                  DatabaseService.supplierFields[1] : nameController.text,
                  DatabaseService.supplierFields[2] : int.tryParse(phoneController.text),
                  DatabaseService.supplierFields[3] : emailController.text,
                  DatabaseService.supplierFields[4] : addressController.text,
                  
                });

                refresh();
                Navigator.pop(context);
                

                



              }, child: Text("Add Supplier")),


            ],
           
            ),

            SizedBox(width: screenSize.width*0.02,),
          
        ],
      ),


    );
  }
}