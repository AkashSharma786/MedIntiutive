import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/medicine/medicine_add.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/medicine/medicine_delete.dart';
import 'package:flutter_application_1/pages/store_management/section_elements/medicine/medicine_search.dart';

class MedicinePage extends StatefulWidget {
  //int  whichButtonClicked;

  const MedicinePage({super.key});

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
                const MedicineSearch(),
                Container(
                width: screenSize.width*0.6 - 87,
                height: screenSize.height,
                color: Colors.yellow,
                child: const Text(
                  "Supplier Page",
                ),
              )
              ],
            );
          case 2:
            return  Column(
              children: [
                const MedicineAdd(),
                        Expanded(
          child: Container(
            width: screenSize.width,
                 
            color: Colors.purple,
            child: const Text(
              "Medicine Page",
            ),
          ),
        )
              ],
            );
          case 3:
            return Column(
              children: [
                const MedicineDelete(),
                        Expanded(
          child: Container(
            width: screenSize.width,
                 
            color: Colors.purple,
            child: const Text(
              "Medicine Page",
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
