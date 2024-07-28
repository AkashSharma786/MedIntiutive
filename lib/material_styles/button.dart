import 'package:flutter/material.dart';

class MyButtonStyle extends StatefulWidget {
  String text;
  double width;
  double height;
  MyButtonStyle(
      {super.key,
      required this.text,
      required this.width,
      required this.height});
  @override
  _MyButtonStyleState createState() => _MyButtonStyleState();
}

class _MyButtonStyleState extends State<MyButtonStyle> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: widget.height,
        maxWidth: widget.width,

      ),

    
      child: Container(
        decoration: BoxDecoration(
           gradient: const LinearGradient(
              colors: [Color.fromARGB(255, 39, 3, 141), Color.fromARGB(248, 91, 231, 250)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          borderRadius: BorderRadius.circular(30),
        ),
        
       
        child: InkWell(
          onTap: () {
            print("Button Clicked");
          },
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
