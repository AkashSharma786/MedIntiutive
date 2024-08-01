import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MedicineSearch extends StatelessWidget {

  MedicineSearch({super.key});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Container(

      width: screenSize.width * 0.4,
      height: screenSize.height*0.9,
      color: Colors.blue,
      child: Text("Search Medicine"),


    );
  }
}