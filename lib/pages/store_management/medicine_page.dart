import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/medicine/medicine_add.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/medicine/medicine_delete.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/medicine/medicine_search.dart';

class MedicinePage extends StatefulWidget {
  //int  whichButtonClicked;

  MedicinePage({super.key});

  @override
  State<MedicinePage> createState() => MedicinePageState();
}

class MedicinePageState extends State<MedicinePage> {
  int currentClickedButton = 0;
  void updateColumn(int num) {
    setState(() {
      currentClickedButton = num;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Builder(builder: (context){
        switch(currentClickedButton){
          case 1:
            return Row(
              children: [
                MedicineSearch(),

                Expanded(
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
                 
            color: Colors.purple,
            child: Text(
              "Medicine Page",
            ),
          ),
        )
              ],
            );
          case 2:
            return  Row(
              children: [
                MedicineAdd(),

               
              ],
            );
          case 3:
            return Row(
              children: [
                MedicineDelete(),

                Expanded(
          child: Container(
            width: screenSize.width,
            height: screenSize.height,
                 
            color: Colors.purple,
            child: Text(
              "Medicine Page",
            ),
          ),
        )
              ],
            );
          default: 
          return Expanded(
          child: Container(
            width: screenSize.width,
                 
            color: Colors.purple,
            child: Text(
              "Medicine Page",
            ),
          ),
        );
          }
       });
  }
}
