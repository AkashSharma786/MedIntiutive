import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final double width;
  final double height;
  final String?  myLabel;



  const CustomTextField({
    super.key,
    required this.hintText,
    required this.controller,
    required this.width,
    required this.height,
    this.myLabel
  });

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      width: width,
      height: height,
      color: Colors.white,
      child: TextField(
        
          
        controller: controller,
        decoration: InputDecoration(
          labelText:myLabel ,
          hintText: hintText,
          border: const OutlineInputBorder(
            
            borderSide: BorderSide(width: 2,),
          ),
        ),
      ),
    );
  }
}