import 'package:flutter/material.dart';

class MedicineSelectionTile extends StatelessWidget {
  final Map<String, Object?> tableData;
  final List<String> fieldList;
  final Function addSelection;
  TextEditingController quantityController = TextEditingController();
  MedicineSelectionTile({super.key, required this.tableData, required this.fieldList , required this.addSelection});  

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Column(
      children: [
        SizedBox(
          height: screenSize.height * 0.02,
        ),
        Container(
          width: screenSize.width - 100,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
                color: Colors.black, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: screenSize.width * 0.01,
              ),
              Text("${tableData[fieldList[0]]}"),
              Text("${tableData[fieldList[1]]}"),
              Text("${tableData[fieldList[2]]}"),
              Container(
                width: 0.05 * screenSize.width,
                child: TextField(
                  decoration: InputDecoration(hintText: "Quantity"),
                  controller: quantityController,
                ),
              ),
              IconButton(onPressed: (){
                addSelection(tableData, int.parse(quantityController.text));

              }, icon: Icon(Icons.add))
            ],
          ),
        ),
      ],
    );
  }
}
