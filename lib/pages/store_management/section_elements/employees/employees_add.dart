import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/material_styles/custom_labeled_text_field.dart';
import 'package:flutter_application_1/material_styles/date_input.dart';

class EmployeesAdd extends StatelessWidget {
    TextEditingController idController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController photoLocationController = TextEditingController();
  TextEditingController aadhaarController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController experienceController = TextEditingController();
  TextEditingController weatherAdminController = TextEditingController();
  TextEditingController dobDayController = TextEditingController();
  TextEditingController dobMonthController = TextEditingController();
  TextEditingController dobYearController = TextEditingController();

  EmployeesAdd({super.key});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Container(

      width: screenSize.width - 87,
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
              CustomLabeledTextField(label: "Gender", hint: "Male", widgetControl: genderController),
              SizedBox(height: screenSize.height*0.02,),
              CustomLabeledTextField(label: "Photo location" , hint: "D:/directory/imaget/photo.jpg", widgetControl: photoLocationController),
              SizedBox(height: screenSize.height*0.02,),
              CustomLabeledTextField(label: "Aadhaar", hint: "123456789022", widgetControl: aadhaarController),
              SizedBox(height: screenSize.height*0.02,),
             

              ElevatedButton(onPressed: (){

                print("Id : ${idController.text}");
                print("First Name : ${firstNameController.text}");
                print("Address : ${addressController.text}");
                print("Gender : ${genderController.text}");
                print("Photo Location : ${photoLocationController.text}");
                print("Date of Birth : ${dobDayController.text}/${dobMonthController.text}/${dobYearController.text}");
                print("Aadhaar : ${aadhaarController.text}");
                print("Phone Number : ${phoneNumberController.text}");
                print("Last Name : ${lastNameController.text}");
                print("Experience : ${experienceController.text}");
                print("Weather Admin : ${weatherAdminController.text}");
                
                


              }, child: Text("Add Employee")),


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
              Row(children: [
                Text("DOB : "),
                DateInput( dayControl: dobDayController, monthControl: dobMonthController, yearControl: dobYearController,),
              ],)


            ],

          )
        ],
      ),


    );
  
  }
}