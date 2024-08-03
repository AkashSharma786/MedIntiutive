import 'package:flutter/material.dart';
import 'package:flutter_application_1/database_service.dart';
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
  List<String> fieldList = DatabaseService.ordersFields;
  
  late List<Map<String, Object?>> selectedMedicines;

  int currentClickedButton = 0;
  void updateColumn(int num) {
    setState(() {
      currentClickedButton = num;
    });
  }

  List<Map<String, Object?>> getSelected(List<Map<String, Object?>> data){
    return data;
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

  


void showSelectedDialog(){

  showDialog(context: context, builder: (context){

    return AlertDialog(
      title: Text("Update Employee"),
      content: MedicineSelectionDialog(refresh: searchOrders,)
      
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
                return NewOrder(showSelectionDialog: showSelectedDialog,);
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
