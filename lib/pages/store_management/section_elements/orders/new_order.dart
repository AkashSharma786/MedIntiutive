import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/database_service.dart';
import 'package:flutter_application_1/material_styles/button.dart';
import 'package:flutter_application_1/material_styles/custom_labeled_text_field.dart';
import 'package:flutter_application_1/material_styles/date_input.dart';
import 'package:flutter_application_1/material_styles/medicine_delete_tile.dart';
import 'package:flutter_application_1/material_styles/medicine_selected_tile.dart';
import 'package:flutter_application_1/material_styles/medicine_selection_dialog.dart';
import 'package:flutter_application_1/material_styles/medicine_selection_tile.dart';
import 'package:flutter_application_1/material_styles/supplier_selection_dialog.dart';
import 'package:flutter_application_1/material_styles/supplier_tile.dart';

class NewOrder extends StatefulWidget {


  TextEditingController messageController;
  TextEditingController dateController;
  VoidCallback refresh;
  Map<String, Object?>? data;
  String? buttonName;

  NewOrder({super.key ,

    required this.messageController,
    required this.dateController,
    required this.refresh,
    this.data,
    this.buttonName
    
   });

  @override
  State<NewOrder> createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {


  TextEditingController OrderDateController = TextEditingController();

  List<Map<String, Object?>> selectedMedicines = [];

  List<int> quantities = [];
    Map<String, Object?> selectedSupplier = {};
    final List<String> fieldMedicineList = DatabaseService.medicineFields;
  final List<String> supplierFieldList = DatabaseService.supplierFields;
  final List<String> fieldList = DatabaseService.ordersFields;
    Future<List<Map<String, Object?>>> items = DatabaseService.showItems("orders");
    int supplierId = 0;

    
  void removeSelection(Map<String, Object?> data, int quantity) {
    setState(() {
      selectedMedicines.remove(data);
      quantities.remove(quantity);
    });
  }


  void setSelectedSupplier(Map<String, Object?> data){
   selectedSupplier = data;
   setState(() {});

 }

  void refreshOrder(){
    
      DatabaseService.searchItem("supplier",
        supplierFieldList[0], supplierId,
         supplierFieldList[1], "",
         
          supplierFieldList[3], "").then((value){
              setState(() {
            selectedSupplier = value[0];
               });
          });
        

 

  }

 
  void showSelectedDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Select Medicines"),
            content: MedicineSelectionDialog(
              refresh: searchOrders,
              getSelected: getSelected,
            ),
          );
        });
  }
  
  void searchOrders() {
    setState(() {
      items = DatabaseService.searchItem(
          'orders', fieldList[0], null, fieldList[1], "", fieldList[2], "");
    });
  }
    void getSelected(List<Map<String, Object?>> data, List<int> quantities) {
    selectedMedicines = data;
    this.quantities = quantities;
    setState(() {});
   // print("selection shown" + selectedMedicines.toString());
  }


  void showSupplierDialog(){

            showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Select Supplier"),
            content:  SupplierSelectionDialog(selectSupplier: setSelectedSupplier,)
          );
        });
    

  }


  
  void placeOrder(){

      DatabaseService.addItems('orders', {
        
      fieldList[0]: null,
      fieldList[1]: int.tryParse(widget.dateController.text),
      fieldList[2]: null,
      fieldList[3]: int.tryParse('${selectedSupplier[supplierFieldList[0]]}'),
      fieldList[4]: null,
      fieldList[5]: null,
      fieldList[6]: widget.messageController.text
    });
  }
    

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;
      void removeSelection(Map<String, Object?> data, int quantity) {
    setState(() {
      selectedMedicines.remove(data);
      quantities.remove(quantity);
    });
  }

    if(widget.data != null){
      widget.messageController.text =  "${ widget.data?[fieldList[6]]}";
      widget.dateController.text = "${ widget.data?[fieldList[1]]}";
      supplierId = int.parse("${widget.data?[fieldList[3]]}");
      refreshOrder();
      
      
    }

    return Container(

      width: screenSize.width,
      height: screenSize.height*0.8,
     
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
          
              ElevatedButton(onPressed: (){
          
                showSelectedDialog();
              }, child: Text("Select Medicines")),
          
          
              ElevatedButton(onPressed: (){
          
                showSupplierDialog();
          
              }, child: Text("Select Supplier")),
          
          
              CustomLabeledTextField(label: "Date",
               hint: "ddmmyyyy",
                widgetControl: widget.dateController,
                buttonWidth: screenSize.width*0.1,
              
                ),
              
          
              SizedBox(
                      width: screenSize.width*0.3,
                      height: 40,
                      child: TextField(
                    
                        controller: widget.messageController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Message",
                          counterText: "",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                            ),
                          ),
                        ),
                      ),
                    ),
          
              
          
              ElevatedButton(onPressed: (){
                if(widget.data != null){
                  DatabaseService.updateItems('orders', {
                    fieldList[0]: widget.data?[fieldList[0]],
                    fieldList[1]: int.tryParse(widget.dateController.text),
                    fieldList[2]: null,
                    fieldList[3]: int.tryParse('${selectedSupplier[supplierFieldList[0]]}'),
                    fieldList[4]: null,
                    fieldList[5]: null,
                    fieldList[6]: widget.messageController.text
                  }, int.parse("${widget.data?[fieldList[0]]}"));
                }
                else{
                  placeOrder();
                }

                
                
                widget.refresh();
                Navigator.pop(context);
              
              }, child: Text(widget.buttonName?? "Place Order"))
          
              
          
          
            ],),

            Row(
                    children: [
                      Container(
                        width: screenSize.width * 0.3,
                        height: screenSize.height * 0.8 - 96,
                        color: Colors.green,
                        child: ListView.builder(
                          itemCount: selectedMedicines.length,
                          itemBuilder: (context, index) {
                            print("medicines at index " +
                                selectedMedicines[index].toString());
                            return MedicineSelectedTile(
                              tableData: selectedMedicines[index],
                              fieldList: fieldMedicineList,
                              quantity: quantities[index],
                              removeSelection: removeSelection,
                            );
                          },
                        ),
                      ),

                      Builder(
                        builder: (context) {
                          if(selectedSupplier.isEmpty)
                          {
                            return SizedBox();
                          }
                          return SupplierTile(tableData: selectedSupplier,
                           fieldList: supplierFieldList,
                           tileWidth: screenSize.width * 0.6,
                        
                          
                          );
                        }
                      )

                      
                    
                    
                    ],
                  )
        ],
      ),


    );
  }
}