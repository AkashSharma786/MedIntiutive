import 'package:flutter/material.dart';

class MedicinePage extends StatefulWidget {

  const MedicinePage({super.key});

  @override
  State<MedicinePage> createState() => _MedicinePageState();
  
}

class _MedicinePageState extends State<MedicinePage> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(

      children: [

        Container(
          width: screenSize.width,
          height: 50,
          color: Colors.orange,
        ),

        Container(
          width: screenSize.width,
          height: screenSize.height-146,
          color: Colors.purple,
          child: Text("Medicine Page",),
        )


      ],


    );
      

    
  }
}