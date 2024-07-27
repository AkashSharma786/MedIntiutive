import 'package:flutter/material.dart';

class MyButtonStyle extends StatefulWidget {
  String text;
  MyButtonStyle({Key? key, required this.text}):super(key: key);
  @override
  _MyButtonStyleState createState() => _MyButtonStyleState();
}

class _MyButtonStyleState extends State<MyButtonStyle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
          onPressed: () {},
          child: Ink(
            width: 200,
            height: 50,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 39, 3, 141), Color.fromARGB(248, 91, 231, 250)],
                transform: GradientRotation(0.8),
              ),
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Center(
              
              
              child: Text(
                widget.text,
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      
    );
  }
}