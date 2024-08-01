import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DateInput extends StatelessWidget{
  TextEditingController dayControl;
  TextEditingController monthControl;
  TextEditingController yearControl;

  DateInput({super.key ,required this.dayControl, required this.monthControl, required this.yearControl});

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
                    controller: dayControl,
                    maxLength: 4,
                    
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
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
                    controller: monthControl,
                    maxLength: 4,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
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
                    controller: yearControl,
                    maxLength: 4,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
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