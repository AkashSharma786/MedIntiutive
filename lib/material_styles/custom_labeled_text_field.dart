import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomLabeledTextField extends StatelessWidget {
  String label;
  String hint;
  double? buttonWidth;
  double? buttonHeight;
  TextEditingController widgetControl;

  CustomLabeledTextField({super.key, required this.label, required this.hint, required this.widgetControl, this.buttonWidth, 
  this.buttonHeight});
   
  
  @override
  Widget build(BuildContext context) {

     Size screenSize = MediaQuery.of(context).size;

    if(buttonWidth == null)
    {
      buttonWidth =( screenSize.width*0.25);
    }

    if(buttonHeight == null)
    {
      buttonHeight = 40;
    }
     
   
    return
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(label,
              
              style: TextStyle(
                fontSize: 17,
               
          
              ),
              ),
          
          
              
              SizedBox(
                      width: buttonWidth,
                      height: buttonHeight,
                      child: TextField(
                    
                        
                        controller: widgetControl,
                        decoration: InputDecoration(
                          
                          hintText: hint,
                          
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 2,
                            ),
          
          
                          ),
                        ),
                      ),
                    ),
          



             

                  ],
                ),
              );
  }
}