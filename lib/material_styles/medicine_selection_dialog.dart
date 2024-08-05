import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/database_service.dart';
import 'package:flutter_application_1/material_styles/custom_labeled_text_field.dart';
import 'package:flutter_application_1/material_styles/date_input.dart';
import 'package:flutter_application_1/material_styles/medicine_selected_tile.dart';
import 'package:flutter_application_1/material_styles/medicine_selection_tile.dart';
import 'package:flutter_application_1/material_styles/tile.dart';
import 'package:flutter_application_1/pages/store_management/sections/medicine_section.dart';
import 'package:path/path.dart';

class MedicineSelectionDialog extends StatefulWidget {



  final VoidCallback refresh;
  final Function getSelected;

 

  MedicineSelectionDialog({super.key, required this.refresh , required this.getSelected});

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
  

  void addSelection(Map<String, Object?> data, int quantity){
     bool contains = selectedMedicinesList.any((element) => mapEquals(element, data));
     


    if(!contains){
      
     selectedMedicinesList.add(data);
      this.quantity.add(quantity);

    }
  
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

      width: screenSize.width*0.8,
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
                 widget.refresh();
                 Navigator.pop(context);
                
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
                  color: Colors.purple,
                  child: ListView.builder(
                    itemCount: tableData.length,
                    itemBuilder: (context, index) {
                      return MedicineSelectionTile(
                          tableData: tableData[index], fieldList: fieldList,
                          addSelection: addSelection,
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
            color: Colors.green,
            child: ListView.builder(
              itemCount: selectedMedicinesList.length,
              itemBuilder: (context, index){
                return MedicineSelectedTile(
                  tableData: selectedMedicinesList[index],
                  fieldList: fieldList,
                  quantity: quantity[index],
                  removeSelection: removeSelection,
                );
              },
            
              
              ),
          )
          
         
        ],
      ),


    );
  
  }
}