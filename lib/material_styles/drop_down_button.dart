import 'package:flutter/material.dart';

class DropdownButtonExample extends StatefulWidget {
  List<String> dropdownText;
  DropdownButtonExample({super.key, required this.dropdownText});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {


  @override
  Widget build(BuildContext context) {
    List<String> list = widget.dropdownText;
    
    String dropdownValue = list.first;
    return Container(
      width: 30,

    
      child: DropdownButton<String>(
        
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 19,
        style: const TextStyle(color: Colors.deepPurple),
        isExpanded: true,
        isDense: true,
        
        underline: const SizedBox.shrink(),
       
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValue = value!;
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}