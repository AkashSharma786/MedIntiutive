import 'package:flutter/material.dart';
import 'package:flutter_application_1/material_styles/button.dart';
import 'package:flutter_application_1/material_styles/custom_text_field.dart';
import 'package:flutter_application_1/material_styles/info_field.dart';
import 'package:flutter_application_1/material_styles/bill_entry.dart';
import 'package:flutter_application_1/generate_pdf.dart';
import 'package:flutter_application_1/material_styles/medicine_selection_dialog.dart';

class BillingPage extends StatefulWidget {
  const BillingPage({Key? key}) : super(key: key);
  @override
  State<BillingPage> createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final disCountController = TextEditingController();
    List<Map<String, Object?>> medicineList = [];
    List<int> quantities =[];



    void getSelected(List<Map<String, Object?>> medList, List<int> amounts){
      medicineList = medList;
      quantities = amounts;
    }



    return Scaffold(
      appBar: AppBar(
        title: Text('Generate Bill'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [

         Row(
          children: [

            Container(width: screenWidth *0.28,
            child: Column(children: [
              Text("Invoice", style: TextStyle(fontSize: 30),),
               
              Text("<<Street, City>>"),
              Text("<<State, Pincode -700190>>"),
              Text("<<Phone : 7845965896"),
              Text("Email : someone@email.com"),
              Text("Date : 15/54/1545"),

            ],),

            ),


            MedicineSelectionDialog(getSelected: getSelected),
          ],
         ),
         
            


            Container(
              child: Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.05,
                  ),
                  Text("Total Amount :"),
                  Text("1000"),
                  SizedBox(
                    width: screenWidth * 0.05,
                  ),
                  CustomTextField(
                      hintText: "Enter Discount",
                      controller: disCountController,
                      width: screenWidth * 0.2,
                      height: screenHeight * 0.06),
              
                  SizedBox(
                    width: screenHeight * 0.35,
                  ),
                  MyButtonStyle(
                      text: "Generate Bill",
                      width: 200,
                      height: 50,
                      onTap: () {
                        GenerateInvoice newBill = GenerateInvoice(itemList: medicineList, quatities: quantities, discount: double.parse(disCountController.text) );
                        newBill.generatePdf();
                      

                      }),
                ],
              ),
              color: Colors.white,
              height: screenHeight * 0.1,
              width: screenWidth,
            ),
          ],
        ),
      ),
    );
  }
}
