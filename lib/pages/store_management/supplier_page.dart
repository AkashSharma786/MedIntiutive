import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/supplier/add_supplier.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/supplier/delete_supplier.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/supplier/edit_supplier.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/supplier/search_supplier.dart';

class SupplierPage extends StatefulWidget {
  const SupplierPage({super.key});

  @override
  State<SupplierPage> createState() => SupplierPageState();
}

class SupplierPageState extends State<SupplierPage> {
  int currentClickedButton = 0;
  void updateColumn(int num) {
    setState(() {
      currentClickedButton = num;
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
              SearchSupplier(),
              Expanded(
                child: Container(
                  width: screenSize.width,
                  color: Colors.yellow,
                  child: Text(
                    "Supplier Page",
                  ),
                ),
              )
            ],
          );
        case 2:
          return Row(
            children: [
              AddSupplier(),
              Container(
                width: screenSize.width*0.6 - 87,
                height: screenSize.height,
                color: Colors.yellow,
                child: Text(
                  "Supplier Page",
                ),
              )
            ],
          );
        case 3:
          return Column(
            children: [
              EditSupplier(),
              Expanded(
                child: Container(
                  width: screenSize.width,
                  color: Colors.yellow,
                  child: Text(
                    "Supplier Page",
                  ),
                ),
              )
            ],
          );
        case 4:
          return Column(
            children: [
              DeleteSupplier(),
              Expanded(
                child: Container(
                  width: screenSize.width,
                  color: Colors.yellow,
                  child: Text(
                    "Supplier Page",
                  ),
                ),
              )
            ],
          );
        default:
          return const SizedBox();
      }
    });
  }
}
