import 'package:flutter/material.dart';
import 'package:flutter_application_1/database_service.dart';
import 'package:flutter_application_1/material_styles/custom_labeled_text_field.dart';
import 'package:flutter_application_1/material_styles/supplier_delete_tile.dart';
import 'package:flutter_application_1/material_styles/supplier_edit_tile.dart';
import 'package:flutter_application_1/material_styles/supplier_tile.dart';

class SupplierSelectionDialog extends StatefulWidget {
  Function selectSupplier;

  SupplierSelectionDialog(
      {super.key,
      required this.selectSupplier,
  
      });

  @override
  State<SupplierSelectionDialog> createState() => _SupplierSelectionDialogState();
}

class _SupplierSelectionDialogState extends State<SupplierSelectionDialog> {
  TextEditingController idController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  Future<List<Map<String, Object?>>> items = DatabaseService.showItems('supplier');

  List<String> fieldList = DatabaseService.supplierFields;
  Map<String, Object?> selectedData = {};

  void updateSearch() {
    setState(() {
      items = DatabaseService.searchItem(
          'supplier', fieldList[0], int.tryParse(idController.text),
           fieldList[1], nameController.text,
            fieldList[2], emailController.text);
    });
  }

  void selectSupplier(Map<String, Object?> data) {
    selectedData = data;
    widget.selectSupplier(data);
    setState(() {});
    Navigator.pop(context);
   
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      width: screenSize.width * 0.8 +19,
      height: screenSize.height*0.7,
      color: Colors.blue,
      child: Column(
        children: [
          Row(
               
            children: [
          
              CustomLabeledTextField(
                  label: "id",
                  hint: "23",
                  widgetControl: idController),
                  
              CustomLabeledTextField(
                  label: "Supplier Name",
                  hint: "Harih Rao",
                  widgetControl: nameController),
              CustomLabeledTextField(
                  label: "email",
                  hint: "someone@mail.com",
                  widgetControl: emailController),
              ElevatedButton(
                  onPressed: () { 
                    print(idController.text);
                    print(nameController.text);
                    print(emailController.text);
                    updateSearch();

                    },
                  child: const Text("Search")),
            ],
          ),

          FutureBuilder(
              future: items,
              builder: (context, snapshot) {
                late List<Map<String, Object?>> tableData;
                if (snapshot.hasError) {
                  return const Center(
                    child: Text("Error Occured"),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No medicines found.'));
                } else {
                  tableData = snapshot.data!;
               
                return Container(
                  width: screenSize.width-87,
                  height: screenSize.height*0.6,
                  color: Colors.purple,
                  child: ListView.builder(
                    itemCount: tableData.length,
                    itemBuilder: (context, index) {
                      return SupplierEditTile(tableData: tableData[index], fieldList: fieldList, update: selectSupplier);  
                    },
                  ),
                );
              }

              })
          



        ],
      ),
    );
  }
}
