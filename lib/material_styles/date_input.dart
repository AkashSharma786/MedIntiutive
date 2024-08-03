import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DateInput extends StatelessWidget{
  const DateInput({super.key});


  @override
  build(BuildContext context){ 
    Size screenSize = MediaQuery.of(context).size;
    
    return Container(
            color: Colors.white,
            width: screenSize.width * 0.18,
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
               
                
                SizedBox(
                  width: 55,
                  height: 40,
                  child: TextField(
                    maxLength: 4,
                    
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      hintText: "Day",
                      counterText: "",
                      border:  OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                
                SizedBox(
                  width: 75,
                  height: 40,
                  child: TextField(
                    maxLength: 4,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Month",
                      counterText: "",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),



                
                SizedBox(
                  width: 60,
                  height: 40,
                  child: TextField(
                    maxLength: 4,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: "Year",
                      counterText: "",
                      border:  OutlineInputBorder(
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