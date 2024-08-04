import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/material_styles/button.dart';
import 'package:flutter_application_1/material_styles/custom_labeled_text_field.dart';
import 'package:flutter_application_1/material_styles/date_input.dart';

class NewOrder extends StatelessWidget {
  TextEditingController OrderDateController = TextEditingController();

  VoidCallback showSelectionDialog;

  NewOrder({super.key , required this.showSelectionDialog});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Container(

      width: screenSize.width,
      height: 64,
     
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          ElevatedButton(onPressed: (){

            showSelectionDialog();
          }, child: Text("Select Medicines")),
          ElevatedButton(onPressed: (){}, child: Text("Select Supplier")),
      

          CustomLabeledTextField(label: "Date",
           hint: "ddmmyyyy",
            widgetControl: OrderDateController,
            buttonWidth: screenSize.width*0.1,
          
            ),
          

          SizedBox(
                  width: screenSize.width*0.3,
                  height: 40,
                  child: TextField(
                
                    
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "Message",
                      counterText: "",
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ),

          

          ElevatedButton(onPressed: (){
            print(" from ${OrderDateController.text}");
          }, child: Text("Place Order"))

    


        ],),


    );
  }
}