import 'package:flutter/material.dart';
import 'package:flutter_application_1/database_service.dart';
import 'package:flutter_application_1/material_styles/medicine_selected_tile.dart';
import 'package:flutter_application_1/material_styles/medicine_selection_dialog.dart';
import 'package:flutter_application_1/material_styles/orders_tile.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/orders/cancel_order.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/orders/modify_order.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/orders/new_order.dart';

class OrdersPage extends StatefulWidget {
  const OrdersPage({super.key});

  @override
  State<OrdersPage> createState() => OrdersPageState();
}

class OrdersPageState extends State<OrdersPage> {
  Future<List<Map<String, Object?>>> items = DatabaseService.showItems("orders");
  List<String> fieldMedicineList = DatabaseService.medicineFields;
  List<String> fieldList = DatabaseService.ordersFields;
  
  List<Map<String, Object?>> selectedMedicines = [];
  List<int> quantities = [];

  int currentClickedButton = 0;
  void updateColumn(int num) {
    setState(() {
      currentClickedButton = num;
    });
  }

  void getSelected(List<Map<String, Object?>> data, List<int> quantities){
    selectedMedicines = data;
    this.quantities = quantities;
    setState(() {
      
    });
    print( "selection shown" + selectedMedicines.toString());
  }

  void searchOrders()
  {
    setState(() {
      items = DatabaseService.searchItem('orders',
       fieldList[0], null,
       fieldList[1], "",
       fieldList[2], "");
    });

  }

  
  void removeSelection(Map<String, Object?> data , int quantity){
    setState(() {
      selectedMedicines.remove(data);
      quantities.remove(quantity);
    });
  }

  


void showSelectedDialog(){

  showDialog(context: context, builder: (context){

    return AlertDialog(
      title: Text("Update Employee"),
      content: MedicineSelectionDialog(refresh: searchOrders, getSelected: getSelected,),
      
    );

  });


}



  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
      children: [


        Builder(builder: (context){
            switch(currentClickedButton){
              case 1:
                return Column(
                  children: [
                    NewOrder(showSelectionDialog: showSelectedDialog,),
                    Container(
            width: screenSize.width*0.3,
            height: screenSize.height*0.8-96,
            color: Colors.green,
            child: ListView.builder(
              itemCount: selectedMedicines.length,
              itemBuilder: (context, index){
                print("medicines at index "+ selectedMedicines[index].toString());
                return MedicineSelectedTile(
                  tableData: selectedMedicines[index], fieldList: fieldMedicineList,
                  quantity: quantities[index],
                  removeSelection: removeSelection,
                );
              },
            
              
              ),
          )
                  ],
                );
              case 2:
                return ModifyOrder();
              case 3:
                return CancelOrder();
              default: 
              return FutureBuilder(
              future: DatabaseService.showItems("orders"),
              builder: (context, snapshot) {
                late List<Map<String, Object?>> tableData;
                if (snapshot.hasError) {
                  const Center(
                    child: Text("Error Occured"),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('Orders found.'));
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
                      return OrdersTile(tableData: tableData[index], fieldList: fieldList,);
                    },
                  ),
                );
              })
;
              }
           }),



    
      ],
    );
  }
}
