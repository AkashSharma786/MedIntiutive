
import 'package:flutter/material.dart';

class MyButtonStyle extends StatefulWidget {
  String text;
  double width;
  double height;
  final VoidCallback onTap;
  MyButtonStyle({super.key, required this.text, required this.width, required this.height, required this.onTap});
  @override
  _MyButtonStyleState createState() => _MyButtonStyleState();
}

class _MyButtonStyleState extends State<MyButtonStyle> {
  @override
  Widget build(BuildContext context) {
    return Container(
          
     
          child: InkWell(
            onTap: (){

              widget.onTap();
            },
            borderRadius: BorderRadius.circular(18.0),
            child:Ink(

            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color.fromARGB(255, 39, 3, 141), Color.fromARGB(248, 91, 231, 250)],
                transform: GradientRotation(0.8),
              ),
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Center(
              
              
              child: Text(
                widget.text,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          ),
        
      
    );
  }
}