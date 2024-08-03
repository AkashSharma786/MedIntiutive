import 'package:flutter/material.dart';
import 'package:flutter_application_1/material_styles/button.dart';
import 'package:flutter_application_1/material_styles/date_input.dart';

class NewOrder extends StatelessWidget {

  const NewOrder({super.key});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return SizedBox(

      width: screenSize.width,
      height: 50,
     
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          ElevatedButton(onPressed: (){}, child: const Text("Select Medicines")),
          ElevatedButton(onPressed: (){}, child: const Text("Select Supplier")),
          const Text("Order Date: "),
          const DateInput(),

          const SizedBox(
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