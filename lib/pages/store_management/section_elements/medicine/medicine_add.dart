import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/database_service.dart';
import 'package:flutter_application_1/material_styles/custom_labeled_text_field.dart';
import 'package:flutter_application_1/material_styles/date_input.dart';

class MedicineAdd extends StatelessWidget {
  final database ;
  TextEditingController serialController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController sciNameController = TextEditingController();
  TextEditingController brandController = TextEditingController();
  TextEditingController typeController = TextEditingController();
  TextEditingController mRPController = TextEditingController();
  TextEditingController sellingPriceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController usageDirectionController = TextEditingController();
  TextEditingController rackDetailsController = TextEditingController();
  VoidCallback refresh;

  MedicineAdd({super.key, required this.database, required this.refresh});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Container(

      width: screenSize.width*0.56,
      height: screenSize.height*0.9,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      
      child: Column(
        children: [
          
             SizedBox(
                width: screenSize.width * 0.02,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: screenSize.width * 0.02,),
             
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomLabeledTextField(label: "Serial Number", hint: "563", widgetControl: serialController),
                   SizedBox(height: screenSize.height*0.02,),
                  CustomLabeledTextField(label: "Name", hint: "Dolo 650", widgetControl: nameController),
                  SizedBox(height: screenSize.height*0.02,),
                  CustomLabeledTextField(label: "Scientific Name", hint: "Paracetamol 650mg", widgetControl: sciNameController),
                  SizedBox(height: screenSize.height*0.02,),
                  CustomLabeledTextField(label: "Brand", hint: "Cipla", widgetControl: brandController),
                  SizedBox(height: screenSize.height*0.02,),
                  CustomLabeledTextField(label: "Type" , hint: "Cipla", widgetControl: typeController),
                  SizedBox(height: screenSize.height*0.02,),
                  CustomLabeledTextField(label: "MRP", hint: "400.00", widgetControl: mRPController),
                  SizedBox(height: screenSize.height*0.02,),
                 
                        
                  ElevatedButton(onPressed: (){
                    // print("Serial Number : ${serialController.text}");
                    // print("Name : ${nameController.text}");
                    // print("Scientific Name : ${sciNameController.text}");
                    // print("Brand : ${brandController.text}");
                    // print("Type : ${typeController.text}");
                    // print("MRP : ${mRPController.text}");
                    // print("Selling Price : ${sellingPriceController.text}");
                    // print("Description : ${descriptionController.text}");
                    // print("Image : ${imageController.text}");
                    // print("Usage Direction : ${usageDirectionController.text}");
                    // print("Rack Details : ${rackDetailsController.text}");
                        
                    DatabaseService.addItems( DatabaseService.tableName[0],{
                      DatabaseService.medicineFields[1] : nameController.text,
                      DatabaseService.medicineFields[2] : sciNameController.text,
                      DatabaseService.medicineFields[3] : double.parse(mRPController.text),
                      DatabaseService.medicineFields[4] : brandController.text,
                      DatabaseService.medicineFields[5] : typeController.text,
                      DatabaseService.medicineFields[6] : double.parse(sellingPriceController.text),
                      DatabaseService.medicineFields[7] : descriptionController.text,
                      DatabaseService.medicineFields[8] : imageController.text,
                      DatabaseService.medicineFields[9] : usageDirectionController.text,
                      DatabaseService.medicineFields[10] : rackDetailsController.text,
                    });
                        
                    refresh();
                        
                    Navigator.pop(context);
                    
                        
                    
                        
                        
                        
                  }, child: Text("Add Medicine")),
                        
                        
                ],
               
                ),
                        
              SizedBox(
                width: screenSize.width * 0.02,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                        
                        
                children: [
                        
                  CustomLabeledTextField(label: "selling Price ", hint: "200.00", widgetControl: sellingPriceController),
                  SizedBox(height: screenSize.height*0.02,),
                        
                  CustomLabeledTextField(label: "Description", hint: "two time a day", widgetControl: descriptionController),
                  SizedBox(height: screenSize.height*0.02,),
                  CustomLabeledTextField(label: "Image", hint: "D:/image/dolo650.jpg", widgetControl: imageController),
                  SizedBox(height: screenSize.height*0.02,),
                  CustomLabeledTextField(label: "usage", hint: "Used in fever ", widgetControl: usageDirectionController),
                  SizedBox(height: screenSize.height*0.02,),
                        
                  CustomLabeledTextField(label: "Rack Details", hint: "Placed on rack 14 ", widgetControl: rackDetailsController),
                 
                 
                        
                        
                ],
                        
              ),
            
            ],
          ),
        ],
      ),


    );
  }
}