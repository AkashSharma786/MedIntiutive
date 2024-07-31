import 'package:flutter/material.dart';

class MedicineSection extends StatefulWidget {

  const MedicineSection({super.key});

  @override
  State<MedicineSection> createState() => _MedicineSectionState();
}

class _MedicineSectionState extends State<MedicineSection> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: 40,
      width: screenSize.width,
      color: Colors.cyan,
      child: ButtonBar(
        alignment: MainAxisAlignment.spaceEvenly,
        children: [
          OutlinedButton(onPressed: (){}, child: Text('Search')),
          OutlinedButton(onPressed: (){}, child: Text('Add')),
          OutlinedButton(onPressed: (){}, child: Text('Delete')),
          OutlinedButton(onPressed: (){}, child: Text('View')),
          
           
           
          
        ],
      ),

    ) ;
  }
}