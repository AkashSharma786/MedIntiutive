import 'package:flutter/material.dart';
import 'package:flutter_application_1/database_service.dart';
import 'package:flutter_application_1/material_styles/medicine_tile.dart';
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
   TextEditingController serialController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController sciNameController = TextEditingController();
    List<String> fieldList = DatabaseService.medicineFields;
  late Future<List<Map<String, Object?>>> items = DatabaseService.showItems('medicine');


  int currentClickedButton = 0;
  void updateColumn(int num) {
    setState(() {
      currentClickedButton = num;
    });
  }

  void search() {

    // print("${serialController.text}");
    // print("${nameController.text}");
    // print("${sciNameController.text}");

    
    //   items = DatabaseService.searchItem(
    //     "medicine",
    //     fieldList[0],
        
    //     int.parse(serialController.text) ,
        
    //     fieldList[1],
    //     nameController.text,
       
    //     fieldList[2],
    //     sciNameController.text
        
    //     );
      
  

    
  }


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Builder(builder: (context)  {
      switch (currentClickedButton) {
        case 1:
          return Column(
            children: [
              MedicineSearch(
                  serialController: serialController,
                  sciNameController: sciNameController,
                  nameController: nameController,
                  search: search,
                  ),
                  
              FutureBuilder(
              future: DatabaseService.showItems("medicine"),
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
                  width: screenSize.width-87,
                  height: screenSize.height*0.9-96,
                  color: Colors.purple,
                  child: ListView.builder(
                    itemCount: tableData.length,
                    itemBuilder: (context, index) {
                      return MedicineTile(
                          tableData: tableData[index], fieldList: fieldList);
                    },
                  ),
                );
              })
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
          return Column(
            children: [
              MedicineDelete(
                  serialController: serialController,
                  sciNameController: sciNameController,
                  nameController: nameController,
                  search: search,
                  ),
                  
              FutureBuilder(
              future: DatabaseService.showItems("medicine"),
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
                  width: screenSize.width-87,
                  height: screenSize.height*0.9-96,
                  color: Colors.purple,
                  child: ListView.builder(
                    itemCount: tableData.length,
                    itemBuilder: (context, index) {
                      return MedicineTile(
                          tableData: tableData[index], fieldList: fieldList);
                    },
                  ),
                );
              })
            ],
          );
        default:
         

          return  FutureBuilder(
              future: DatabaseService.showItems("medicine"),
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
                  width: screenSize.width,
                  color: Colors.purple,
                  child: ListView.builder(
                    itemCount: tableData.length,
                    itemBuilder: (context, index) {
                      return MedicineTile(
                          tableData: tableData[index], fieldList: fieldList);
                    },
                  ),
                );
              });
            }

          
      }
    );
  }
}
