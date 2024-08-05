import 'package:flutter/material.dart';
import 'package:flutter_application_1/database_service.dart';
import 'package:flutter_application_1/material_styles/tile.dart';
import 'package:flutter_application_1/material_styles/update_dialog_supplier.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/supplier/add_supplier.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/supplier/search_supplier.dart';

class SupplierPage extends StatefulWidget {
  const SupplierPage({super.key});

  @override
  State<SupplierPage> createState() => SupplierPageState();
}

class SupplierPageState extends State<SupplierPage> {
  int currentClickedButton = 0;
  final fieldList = DatabaseService.supplierFields;
    TextEditingController idController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Future<List<Map<String, Object?>>> items = DatabaseService.showItems('supplier');
  void updateColumn(int num) {
    setState(() {
      currentClickedButton = num;
    });
    if(num == 2){
      showSupplierAddingDialog();
    }
  }

  void searchSupplier(){
    setState(() {
      items = DatabaseService.searchItem('supplier',
       fieldList[0], int.tryParse(idController.text),
        fieldList[1], nameController.text,
         fieldList[2], emailController.text,
         );
      
    });
  }

  void showSupplierAddingDialog(){
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Add Supplier"),
        content: AddSupplier(refresh: searchSupplier,)
      );
    });
  }

  void deleteSupplier(Map<String, Object?> tableData){
   DatabaseService.deleteItem('supplier',int.parse('${tableData[fieldList[0]]}'));

    searchSupplier();
  }

void updateDialog( Map<String, Object?> data ){

  showDialog(context: context, builder: (context){

    return AlertDialog(
      title: Text("Update Employee"),
      content: UpdateDialogSupplier( data: data, refresh: searchSupplier,)
    );
  });


}

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Builder(builder: (context) {
      switch (currentClickedButton) {
        case 1:
          return Column(
            children: [
              SearchSupplier(
                idController: idController,
                nameController: nameController,
                emailController: emailController,
                search: searchSupplier,
                  

              ),

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
                  width: screenSize.width-87,
                  height: screenSize.height*0.9-96,
                 
                  child: ListView.builder(
                    itemCount: tableData.length,
                    itemBuilder: (context, index) {
                      return Tile(tableData: tableData[index],);
                    },
                  ),
                );
              })
              
            ],
          );
     
        case 3:
          return Column(
            children: [
              SearchSupplier(
                idController: idController,
                nameController: nameController,
                emailController: emailController,
                search: searchSupplier,
                  

              ),
              
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
                  width: screenSize.width,
                  height: screenSize.height * 0.8-96,
                  child: ListView.builder(
                    itemCount: tableData.length,
                    itemBuilder: (context, index) {
                      return Tile(tableData: tableData[index],  editFunction: updateDialog, icon: Icon(Icons.edit));
                    },
                  ),
                );
              })
            ],
          );
        case 4:
          return Column(
            children: [
              SearchSupplier(
                idController: idController,
                nameController: nameController,
                emailController: emailController,
                search: searchSupplier,
                  

              ),
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
                  width: screenSize.width-87,
                  height: screenSize.height*0.9-96,
               
                  child: ListView.builder(
                    itemCount: tableData.length,
                    itemBuilder: (context, index) {
                      return Tile(tableData: tableData[index], deleteFunction: deleteSupplier, icon : Icon(Icons.delete));
                    },
                  ),
                );
              })
            ],
          );
        default:
          return FutureBuilder(
              future: DatabaseService.showItems("supplier"),
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

                  child: ListView.builder(
                    itemCount: tableData.length,
                    itemBuilder: (context, index) {
                      return Tile(tableData: tableData[index],);
                    },
                  ),
                );
              }) ;
      }
    });
  }
}
