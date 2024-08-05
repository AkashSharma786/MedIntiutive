import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/database_service.dart';
import 'package:flutter_application_1/material_styles/button.dart';
import 'package:flutter_application_1/material_styles/custom_labeled_text_field.dart';
import 'package:flutter_application_1/material_styles/date_input.dart';
import 'package:flutter_application_1/material_styles/medicine_selected_tile.dart';
import 'package:flutter_application_1/material_styles/medicine_selection_dialog.dart';
import 'package:flutter_application_1/material_styles/medicine_selection_tile.dart';
import 'package:flutter_application_1/material_styles/supplier_selection_dialog.dart';
import 'package:flutter_application_1/material_styles/tile.dart';

class NewOrder extends StatefulWidget {
  TextEditingController messageController;
  TextEditingController dateController;
  VoidCallback refresh;
  Map<String, Object?>? data;
  String? buttonName;

  NewOrder(
      {super.key,
      required this.messageController,
      required this.dateController,
      required this.refresh,
      this.data,
      this.buttonName});

  @override
  State<NewOrder> createState() => _NewOrderState();
}

class _NewOrderState extends State<NewOrder> {
  late Future<void> _initializationFuture;
  TextEditingController OrderDateController = TextEditingController();

  List<Map<String, Object?>> selectedMedicines = [];

  List<int> quantities = [];

  Map<String, Object?> selectedSupplier = {};
  final List<String> fieldMedicineList = DatabaseService.medicineFields;
  final List<String> supplierFieldList = DatabaseService.supplierFields;
  final List<String> fieldList = DatabaseService.ordersFields;
  final List<String> ordersFieldsList = DatabaseService.orderMedicines;
  Future<List<Map<String, Object?>>> items =
      DatabaseService.showItems("orders");
  int supplierId = 0;

  List<Map<String, Object?>> medicinesIdList = [];

  void removeSelection(Map<String, Object?> data, int quantity) {
    setState(() {
      selectedMedicines.remove(data);
      quantities.remove(quantity);
    });
  }

  void setSelectedSupplier(Map<String, Object?> data) {
    selectedSupplier = data;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    if (widget.data != null) {
      widget.messageController.text = "${widget.data?[fieldList[6]]}";
      widget.dateController.text = "${widget.data?[fieldList[1]]}";
      supplierId = int.parse("${widget.data?[fieldList[3]]}");
      _initializationFuture = _initializeData();
      quantities =
          medicinesIdList.map((e) => e[ordersFieldsList[2]] as int).toList();
    }
  }

  Future<void> _initializeData() async {
    await refreshSupplier();
    await getMedicineIdList();
    await getSelectedMedicinesList();

    quantities = medicinesIdList
        .map((e) => e[ordersFieldsList[2]] as int? ?? 0)
        .toList();
  }

  Future<void> getMedicineIdList() async {
    medicinesIdList = await DatabaseService.searchByKey("order_medicines",
        ordersFieldsList[0], int.parse("${widget.data?[fieldList[0]]}"));
  }

  Future<void> getSelectedMedicinesList() async {
    List<Map<String, Object?>> temp = [];

    for (Map<String, Object?> items in medicinesIdList) {
      var result = DatabaseService.searchByKey("medicine", fieldMedicineList[0],
          int.parse("${items[ordersFieldsList[1]]}"));
      temp.add((await result)[0]);
    }
    selectedMedicines = temp;
  }

  Future<void> refreshSupplier() async {
    try {
      var value = await DatabaseService.searchByKey(
        "supplier",
        supplierFieldList[0],
        supplierId,
      );
      setState(() {
        selectedSupplier = value[0];
      });
    } catch (error) {
      // Handle error
    }
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
   
  }

  void showSupplierDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text("Select Supplier"),
              content: SupplierSelectionDialog(
                selectSupplier: setSelectedSupplier,
              ));
        });
  }

  void placeOrder() {
    DatabaseService.addItems('orders', {
      fieldList[0]: null,
      fieldList[1]: int.tryParse(widget.dateController.text),
      fieldList[2]: null,
      fieldList[3]: int.tryParse('${selectedSupplier[supplierFieldList[0]]}'),
      fieldList[4]: null,
      fieldList[5]: null,
      fieldList[6]: widget.messageController.text
    });

    DatabaseService.getLastIndex('orders', fieldList[0]).then((value) {
      for (int i = 0; i < selectedMedicines.length; i++) {
        DatabaseService.addItems('order_medicines', {
          ordersFieldsList[0]: value,
          ordersFieldsList[1]: selectedMedicines[i][fieldMedicineList[0]],
          ordersFieldsList[2]: quantities[i],
          ordersFieldsList[3]: selectedMedicines[i][fieldMedicineList[3]]
        });
      }
    });
  }

  void modifyOrder() {
    DatabaseService.updateItems(
        'orders',
        {
          fieldList[0]: widget.data?[fieldList[0]],
          fieldList[1]: int.tryParse(widget.dateController.text),
          fieldList[2]: null,
          fieldList[3]:
              int.tryParse('${selectedSupplier[supplierFieldList[0]]}'),
          fieldList[4]: null,
          fieldList[5]: null,
          fieldList[6]: widget.messageController.text
        },
        int.parse("${widget.data?[fieldList[0]]}"));
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

    return Container(
      width: screenSize.width,
      height: screenSize.height * 0.8,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                  onPressed: () {
                    showSelectedDialog();
                  },
                  child: Text("Select Medicines")),
              ElevatedButton(
                  onPressed: () {
                    showSupplierDialog();
                  },
                  child: Text("Select Supplier")),
              CustomLabeledTextField(
                label: "Date",
                hint: "ddmmyyyy",
                widgetControl: widget.dateController,
                buttonWidth: screenSize.width * 0.1,
              ),
              SizedBox(
                width: screenSize.width * 0.3,
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
              ElevatedButton(
                  onPressed: () {
                    if (widget.data != null) {
                      modifyOrder();
                    } else {
                      placeOrder();
                    }

                    widget.refresh();
                    Navigator.pop(context);
                  },
                  child: Text(widget.buttonName ?? "Place Order"))
            ],
          ),
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
              Builder(builder: (context) {
                if (selectedSupplier.isEmpty) {
                  return SizedBox();
                }
                return Tile(
                  tableData: selectedSupplier,
                  
                  width: screenSize.width * 0.6,
                );
              })
            ],
          )
        ],
      ),
    );
  }
}
