import 'package:flutter/material.dart';
import 'package:flutter_application_1/database_service.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/medicine/medicine_add.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/medicine/medicine_delete.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/medicine/medicine_search.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class MedicinePage extends StatefulWidget {
  final database = DatabaseService.database;

  MedicinePage({super.key});

  @override
  State<MedicinePage> createState() => MedicinePageState();
}

class MedicinePageState extends State<MedicinePage> {
  int currentClickedButton = 0;
  void updateColumn(int num) {
    setState(() {
      currentClickedButton = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Builder(builder: (context)  {
      switch (currentClickedButton) {
        case 1:
          return Row(
            children: [
              MedicineSearch(),
              Expanded(
                child: Container(
                  width: screenSize.width,
                  height: screenSize.height,
                  color: Colors.purple,
                  child: Text(
                    "Medicine Page",
                  ),
                ),
              )
            ],
          );
        case 2:
          return Row(
            children: [
              MedicineAdd(
                database: widget.database,
              ),
            ],
          );
        case 3:
          return Row(
            children: [
              MedicineDelete(),
              Expanded(
                child: Container(
                  width: screenSize.width,
                  height: screenSize.height,
                  color: Colors.purple,
                  child: Text(
                    "Medicine Page",
                  ),
                ),
              )
            ],
          );
        default:
         

          return FutureBuilder(
            future:  DatabaseService.showMedicines(),

            builder: (context, snapshot){
             late List<Map<String, Object?>> tableData;
              if(snapshot.hasError){
                Center(child: Text("Error Occured"),);
              }
              else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No medicines found.'));
               } 
              else 
              {
                 tableData = snapshot.data! ;

              }
              

              return Expanded(
            child: Container(
              width: screenSize.width,
              color: Colors.purple,
              child: ListView.builder(
                itemCount: tableData.length ,
              
                itemBuilder: (context, index) {
                  Map<String, Object?> medicine = tableData[index];
                  return ListTile(
                  title: Text((tableData[index]).toString()), // Assuming 'name' is a key in the map
                   // Assuming 'description' is a key in the map
                );
                },

                
              ),
            ),
          );
        }
      
    );
            }

          
      }
    );
  }
}
