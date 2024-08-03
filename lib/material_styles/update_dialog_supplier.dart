import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/database_service.dart';
import 'package:flutter_application_1/material_styles/custom_labeled_text_field.dart';
import 'package:flutter_application_1/material_styles/date_input.dart';

class UpdateDialogSupplier extends StatelessWidget {



  TextEditingController idController = TextEditingController() ;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController  = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  
  final VoidCallback refresh;

  Map<String, Object?> data;
  List<String> fieldList = DatabaseService.supplierFields; 

  

  UpdateDialogSupplier({super.key, required this.data , required this.refresh});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    idController.text = "${data[fieldList[0]]}";
    nameController.text = "${data[fieldList[1]]}";
    phoneController.text = "${data[fieldList[2]]}";
    emailController.text = "${data[fieldList[3]]}";
    addressController.text = "${data[fieldList[4]]}";


    return Container(

      width: screenSize.width*0.4,
      height: screenSize.height*0.8,
      color: Colors.blue,
      child: Row(
        children: [

          SizedBox(
            width: screenSize.width * 0.02,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomLabeledTextField(label: "Id", hint: "563", widgetControl: idController),
              SizedBox(height: screenSize.height*0.02,),
              CustomLabeledTextField(label: "Name", hint: "Akash", widgetControl: nameController),
              SizedBox(height: screenSize.height*0.02,),
               CustomLabeledTextField(label: "Phone", hint: "1234567890", widgetControl: phoneController),
              SizedBox(height: screenSize.height*0.02,),
              CustomLabeledTextField(label: "Email", hint: "somemon@mail.com", widgetControl: emailController),
              SizedBox(height: screenSize.height*0.02,),
              CustomLabeledTextField(label: "Address", hint: "90/2 this road, kolkata, west Bengal - 700425", widgetControl: addressController),
             
              ElevatedButton(onPressed: (){

                 DatabaseService.updateItems('supplier', {
                  fieldList[0] : int.tryParse(idController.text),
                  fieldList[1] : nameController.text,
                  fieldList[2] : int.tryParse(phoneController.text),
                  fieldList[3] : emailController.text,
                  fieldList[4] :addressController.text,



                 },int.parse("${data['id']}"));

                 refresh();
                 Navigator.pop(context);
                
                 }, child: const Text("Update")),


            ],
           
            ),

            SizedBox(width: screenSize.width*0.02,),
  
        ],
      ),


    );
  
  }
}