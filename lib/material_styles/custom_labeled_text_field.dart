import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomLabeledTextField extends StatelessWidget {
  String label;
  String hint;
  TextEditingController widgetControl;

  CustomLabeledTextField({super.key, required this.label, required this.hint, required this.widgetControl});
  
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
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
                      width: screenSize.width*0.25,
                      height: 40,
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