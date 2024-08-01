import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/material_styles/button.dart';
import 'package:flutter_application_1/material_styles/date_input.dart';

class NewOrder extends StatelessWidget {

  NewOrder({super.key});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Container(

      width: screenSize.width,
      height: 50,
     
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          ElevatedButton(onPressed: (){}, child: Text("Select Medicines")),
          ElevatedButton(onPressed: (){}, child: Text("Select Supplier")),
          Text("Order Date: "),
          DateInput(),

          SizedBox(
                  width: 200,
                  height: 40,
                  child: TextField(
                
                    
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

          

          MyButtonStyle(text: "Place Order", width: 100, height: 40, onTap: (){})



        ],),


    );
  }
}