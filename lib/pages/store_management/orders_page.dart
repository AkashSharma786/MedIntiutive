import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/database_service.dart';
import 'package:flutter_application_1/material_styles/medicine_selected_tile.dart';
import 'package:flutter_application_1/material_styles/medicine_selection_dialog.dart';
import 'package:flutter_application_1/material_styles/orders_tile.dart';
import 'package:flutter_application_1/material_styles/supplier_delete_tile.dart';
import 'package:flutter_application_1/material_styles/supplier_edit_tile.dart';
import 'package:flutter_application_1/material_styles/supplier_selection_dialog.dart';
import 'package:flutter_application_1/material_styles/supplier_tile.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/orders/new_order.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/supplier/search_supplier.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => OrdersPageState();
}

class OrdersPageState extends State<OrdersPage> {

  List<String> fieldMedicineList = DatabaseService.medicineFields;
  List<String> fieldList = DatabaseService.ordersFields;
  List<String> supplierFieldList = DatabaseService.supplierFields;
  TextEditingController OrderDateController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  Future<List<Map<String, Object?>>> items = DatabaseService.showItems("orders");
 int currentClickedButton = 0;




  List<Map<String, Object?>> selectedMedicines = [];
  List<int> quantities = [];
  Map<String, Object?> selectedSupplier = {};


 


 

 
  void updateColumn(int num) {
    if(num == 1){
      showOrderAddingDialog();
    }
    setState(() {
      currentClickedButton = num;
    });
  }

  void refresh() {
    setState(() {
      items = DatabaseService.showItems("orders");
    });
  }

  showOrderAddingDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add Order'),
            content: NewOrder(
              messageController: messageController,
              dateController: OrderDateController,
              refresh: refresh,
            ),
            
          );
        });
  }

    showOrderModifyingDialog(Map<String, Object?> data) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Add Order'),
            content: NewOrder(
              messageController: messageController,
              dateController: OrderDateController,
              data: data, 
              refresh: refresh,
              buttonName: "Modify Order",
            ),
            
          );
        });
  }






 
  

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Builder(builder: (context) {
          switch (currentClickedButton) {
            case 2:
              return Column(
                children: [
               
                  FutureBuilder(
                  future: items,
                  builder: (context, snapshot) {
                    late List<Map<String, Object?>> tableData;
                    if (snapshot.hasError) {
                      const Center(
                        child: Text("Error Occured"),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('Orders Not found'));
                    } else {
                      tableData = snapshot.data!;
                    }

                    return Container(
                      width: screenSize.width,
                      height: screenSize.height * 0.8,
                      color: Colors.purple,
                      child: ListView.builder(
                        itemCount: tableData.length,
                        itemBuilder: (context, index) {
                          return OrdersTile(
                            tableData: tableData[index],
                            fieldList: fieldList,
                            icon: Icon(Icons.edit),
                            function: showOrderModifyingDialog,
                            

                          );
                        },
                      ),
                    );
                  }
                  
                )

                ],
              );
            case 3:
            
              return FutureBuilder(
                  future: items,
                  builder: (context, snapshot) {
                    late List<Map<String, Object?>> tableData;
                    if (snapshot.hasError) {
                      const Center(
                        child: Text("Error Occured"),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('Orders Not found'));
                    } else {
                      tableData = snapshot.data!;
                    }

                    return Container(
                      width: screenSize.width,
                      height: screenSize.height * 0.8,
                      color: Colors.purple,
                      child: ListView.builder(
                        itemCount: tableData.length,
                        itemBuilder: (context, index) {
                          return OrdersTile(
                            tableData: tableData[index],
                            fieldList: fieldList,
                            icon: Icon(Icons.delete),
                            function: (data){
                              DatabaseService.deleteItem("orders",int.parse("${ data[fieldList[0]]}"));
                              refresh();
                            },
                          );
                        },
                      ),
                    );
                  }
                  
                );

             
            default:
                         return FutureBuilder(
                  future: items,
                  builder: (context, snapshot) {
                    late List<Map<String, Object?>> tableData;
                    if (snapshot.hasError) {
                      const Center(
                        child: Text("Error Occured"),
                      );
                    } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return const Center(child: Text('Orders Not found'));
                    } else {
                      tableData = snapshot.data!;
                    }

                    return Container(
                      width: screenSize.width,
                      height: screenSize.height * 0.8,
                      color: Colors.purple,
                      child: ListView.builder(
                        itemCount: tableData.length,
                        itemBuilder: (context, index) {
                          return OrdersTile(
                            tableData: tableData[index],
                            fieldList: fieldList,
                          );
                        },
                      ),
                    );
                  }
                  
                );





          }
        }),
      
      
      ],
    );
  
  
  }
}
