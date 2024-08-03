import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/database_service.dart';
import 'package:flutter_application_1/material_styles/custom_labeled_text_field.dart';
import 'package:flutter_application_1/material_styles/date_input.dart';

class UpdateDialog extends StatelessWidget {



  TextEditingController idController = TextEditingController() ;
  TextEditingController firstNameController = TextEditingController();
  TextEditingController addressController  = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController photoLocationController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController aadhaarController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController weatherAdminController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  final VoidCallback refresh;

  Map<String, Object?> data;
  List<String> fieldList = DatabaseService.employeesField; 

  

  UpdateDialog({super.key, required this.data , required this.refresh});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    idController.text = "${data[fieldList[0]]}";
    firstNameController.text = "${data[fieldList[1]]}";
    lastNameController.text = "${data[fieldList[2]]}";
    phoneNumberController.text = "${data[fieldList[3]]}";
    emailController.text = "${data[fieldList[4]]}";
    addressController.text = "${data[fieldList[5]]}";
    dobController.text = "${data[fieldList[6]]}";
    genderController.text = "${data[fieldList[7]]}";
    photoLocationController.text = "${data[fieldList[8]]}";
    aadhaarController.text = "${data[fieldList[9]]}";
    experienceController.text = "${data[fieldList[10]]}";
    weatherAdminController.text = "${data[fieldList[1]]}";

    return Container(

      width: screenSize.width*0.7,
      height: screenSize.height*0.9,
      color: Colors.blue,
      child: Row(
        children: [

          SizedBox(
            width: screenSize.width * 0.02,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomLabeledTextField(label: "Id", hint: "563", widgetControl: idController),
              CustomLabeledTextField(label: "First Name", hint: "Akash", widgetControl: firstNameController),
              SizedBox(height: screenSize.height*0.02,),
              CustomLabeledTextField(label: "Address", hint: "90/2 this road, kolkata, west Bengal - 700425", widgetControl: addressController),
              SizedBox(height: screenSize.height*0.02,),

              CustomLabeledTextField(label: "Email", hint: "somemon@mail.com", widgetControl: emailController),
              CustomLabeledTextField(label: "Gender", hint: "Male", widgetControl: genderController),
              SizedBox(height: screenSize.height*0.02,),
              CustomLabeledTextField(label: "Photo location" , hint: "D:/directory/imaget/photo.jpg", widgetControl: photoLocationController),
              SizedBox(height: screenSize.height*0.02,),
              CustomLabeledTextField(label: "Aadhaar", hint: "123456789022", widgetControl: aadhaarController),
              SizedBox(height: screenSize.height*0.02,),
             

              ElevatedButton(onPressed: (){

                 DatabaseService.updateItems('employees', {
                  fieldList[0] : int.tryParse(idController.text),
      fieldList[1] : firstNameController.text,
      fieldList[2] : lastNameController.text,
      fieldList[3] : int.tryParse(phoneNumberController.text),
      fieldList[4] : emailController.text,
      fieldList[5] : addressController.text,
      fieldList[6] : int.tryParse('${dobController.text}'),
      fieldList[7] : genderController.text,
      fieldList[8] : photoLocationController.text,
      fieldList[9] : aadhaarController.text,
      fieldList[10] : experienceController.text,
      fieldList[11] : weatherAdminController.text,


                 },int.parse("${data['id']}"));

                 refresh();
                 Navigator.pop(context);
                
                 }, child: const Text("Update")),


            ],
           
            ),

            SizedBox(width: screenSize.width*0.02,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,


            children: [

              CustomLabeledTextField(label: "Phone Number", hint: "1234567890", widgetControl: phoneNumberController),
              SizedBox(height: screenSize.height*0.02,),
              CustomLabeledTextField(label: "Last Name", hint: "Sharma", widgetControl: lastNameController),
              SizedBox(height: screenSize.height*0.02,),
              CustomLabeledTextField(label: "Experience(years)", hint: "5", widgetControl: experienceController),
              SizedBox(height: screenSize.height*0.02,),
              CustomLabeledTextField(label: "Wheater Admin", hint: "yes ", widgetControl: weatherAdminController),
              SizedBox(height: screenSize.height*0.04,),
              CustomLabeledTextField(label: "Date of Birth", hint: "ddmmyyyy", widgetControl: dobController)
            


            ],

          )
        ],
      ),


    );
  
  }
}