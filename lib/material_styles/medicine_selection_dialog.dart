import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/database_service.dart';
import 'package:flutter_application_1/material_styles/custom_labeled_text_field.dart';
import 'package:flutter_application_1/material_styles/date_input.dart';
import 'package:flutter_application_1/material_styles/medicine_selection_tile.dart';
import 'package:flutter_application_1/pages/store_management/sections/medicine_section.dart';

class MedicineSelectionDialog extends StatelessWidget {



  TextEditingController idController = TextEditingController() ;
  TextEditingController nameController = TextEditingController();
  TextEditingController sciNameController  = TextEditingController();
  Future<List<Map<String, Object?>>> items = DatabaseService.showItems('medicine');
  final VoidCallback refresh;

 
  List<String> fieldList = DatabaseService.medicineFields; 

  

  MedicineSelectionDialog({super.key, required this.refresh});
  List<Map<String, Object?>> selectedMedicinesList = [];

  void addSelection(Map<String, Object?> data){
    selectedMedicinesList.add(data);
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

                

                 refresh();
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
                          tableData: tableData[index], fieldList: fieldList);
                    },
                  ),
                );
              })
  

            ],
           
            ),

          SizedBox(width: screenSize.width*0.02,),

          // ListView.builder(
          //   itemCount: ,
          //   itemBuilder: itemBuilder,

            
          //   )
          
         
        ],
      ),


    );
  
  }
}