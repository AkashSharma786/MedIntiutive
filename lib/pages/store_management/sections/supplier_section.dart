import 'package:flutter/material.dart';

class SupplierSection extends StatefulWidget {

  const SupplierSection({super.key});

  @override
  State<SupplierSection> createState() => _SupplierSectionState();
}

class _SupplierSectionState extends State<SupplierSection> {
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
          OutlinedButton(onPressed: (){}, child: Text('Delete ')),
          OutlinedButton(onPressed: (){}, child: Text('View')),
          
           
           
          
        ],
      ),

    ) ;
  }
}