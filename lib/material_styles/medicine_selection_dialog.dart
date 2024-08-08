import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/database_service.dart';
import 'package:flutter_application_1/material_styles/custom_labeled_text_field.dart';
import 'package:flutter_application_1/material_styles/custom_text_field.dart';
import 'package:flutter_application_1/material_styles/date_input.dart';
import 'package:flutter_application_1/material_styles/tile.dart';
import 'package:flutter_application_1/pages/store_management/sections/medicine_section.dart';
import 'package:path/path.dart';

class MedicineSelectionDialog extends StatefulWidget {



  final VoidCallback? refresh;
  final Function getSelected;

 

  MedicineSelectionDialog({super.key, this.refresh , required this.getSelected});

  @override
  State<MedicineSelectionDialog> createState() => _MedicineSelectionDialogState();
}

class _MedicineSelectionDialogState extends State<MedicineSelectionDialog> {
  TextEditingController idController = TextEditingController() ;

  TextEditingController nameController = TextEditingController();

  TextEditingController sciNameController  = TextEditingController();

  Future<List<Map<String, Object?>>> items = DatabaseService.showItems('medicine');

  List<String> fieldList = DatabaseService.medicineFields; 

  List<Map<String, Object?>> selectedMedicinesList = [];
  List<int> quantity = [];
  TextEditingController quantityController = TextEditingController();
  

  void addSelection(Map<String, Object?> data, int quantityNumber){
 
      
      selectedMedicinesList.add(data);
      quantity.add(quantityNumber);
  

    
  
    setState(() {

     
   });
     
     



   


   // print(selectedMedicinesList);
  }

  void removeSelection(Map<String, Object?> data, int quantity){
    setState(() {
      selectedMedicinesList.remove(data);
      this.quantity.remove(quantity);
    });
  }

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Container(

      width: screenSize.width*0.65,
      height: screenSize.height*0.8,
      color: Colors.white,
      child: Row(
        children: [

          SizedBox(
            width: screenSize.width * 0.02,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomLabeledTextField(label: "Id", hint: "563", widgetControl: idController),
              SizedBox(height: screenSize.height*0.02,),
              CustomLabeledTextField(label: "Name", hint: "Calpol", widgetControl: nameController),
              SizedBox(height: screenSize.height*0.02,),
               CustomLabeledTextField(label: "scientific Name", hint: "paracetamol", widgetControl: sciNameController),
              SizedBox(height: screenSize.height*0.02,),
      
              ElevatedButton(onPressed: (){
                DatabaseService.searchItem("medicine",
                 fieldList[0] , int.tryParse(idController.text),
                 fieldList[1], nameController.text,
                 fieldList[2], sciNameController.text
                 
                 );

                  widget.getSelected(selectedMedicinesList, quantity);

                  if(widget.refresh != null)
                  {
                    widget.refresh??();
                    Navigator.pop(context);
                  }
                
                 
                
                 }, child: const Text("Update")),
              SizedBox(height: screenSize.height*0.02,),
               FutureBuilder(
              future: items,
              builder: (context, snapshot) {
                late List<Map<String, Object?>> tableData;
                if (snapshot.hasError) {
                  const Center(
                    child: Text("Error Occured"),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No medicines found.'));
                } else {
                  tableData = snapshot.data!;
                }

                return Container(
                  width: screenSize.width*0.3,
                  height: screenSize.height*0.5-96,
                  color: Colors.black,
                  child: ListView.builder(
                    itemCount: tableData.length,
                    itemBuilder: (context, index) {
                      return Tile(
                          tableData: tableData[index],
                          icon: const Icon(Icons.add),
                          width: screenSize.width*0.3,
                          textField: 1,
                          
                          dataAndIntegerFunction: addSelection,
                          );
                    },
                  ),
                );
              })
  

            ],
           
            ),

          SizedBox(width: screenSize.width*0.02,),

          Container(
            width: screenSize.width*0.3,
            height: screenSize.height*0.8-96,
            color: Colors.black,
            child: ListView.builder(
              itemCount: selectedMedicinesList.length,
              itemBuilder: (context, index){
                return Tile(
                  tableData: selectedMedicinesList[index],
                  showData: {
                    fieldList[0]: selectedMedicinesList[index][fieldList[0]],
                    fieldList[1]: selectedMedicinesList[index][fieldList[1]],
                    fieldList[2]: selectedMedicinesList[index][fieldList[2]],
                    "quantity": quantity[index]
                  },
                  width: screenSize.width*0.3,
                  icon: const Icon(Icons.remove),
                
                 
                  dataAndIntegerFunction: removeSelection,
                );
              },
            
              
              ),
          )
          
         
        ],
      ),


    );
  
  }
}