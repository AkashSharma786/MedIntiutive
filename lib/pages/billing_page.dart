import 'package:flutter/material.dart';
import 'package:flutter_application_1/material_styles/button.dart';
import 'package:flutter_application_1/material_styles/custom_text_field.dart';
import 'package:flutter_application_1/material_styles/info_field.dart';
import 'package:flutter_application_1/material_styles/bill_entry.dart';

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
    final _name_controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Generate Bill'),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Container(
              color: Colors.white,
              height: screenHeight * 0.1,
              width: screenWidth,
              child: Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  Container(
                    width: screenWidth * 0.6,
                    height: screenHeight * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          offset: const Offset(1, 1),
                          blurRadius: 10,
                          spreadRadius: 2,
                        )
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Tax Invoice',
                          style: TextStyle(
                            fontSize: 30,
                            fontFamily: "Arial",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Date : 12/08/2021',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  Container(
                    width: screenWidth * 0.2,
                    height: screenHeight * 0.1,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/bat_man.jpg'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Container(
                height: screenHeight * 0.1,
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: const Offset(1, 1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "ABC Company",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: screenWidth * 0.05,
                        ),
                        Text(
                          'Address : ',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          "dkdjfkf sfs fsf, kdfsdjf, kjfdfkff, kfjkfggg, kdfjdf, dkfjfsld, kddfjflsd, fsdflf ",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          width: screenHeight * 0.2,
                        ),
                        Text(
                          'Phone Number : ',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                        Text(
                          '1234567890',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                )),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Container(
              height: screenHeight * 0.1,
              width: screenWidth,
              child: Row(
                children: [
                  SizedBox(
                    width: screenWidth * 0.05,
                  ),
                  CustomTextField(
                      hintText: "Medicine Name",
                      controller: _name_controller,
                      width: screenWidth * 0.4,
                      height: screenHeight * 0.06),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  CustomTextField(
                      hintText: "Quantity",
                      controller: _name_controller,
                      width: screenWidth * 0.1,
                      height: screenHeight * 0.06),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  CustomTextField(
                      hintText: "Amount",
                      controller: _name_controller,
                      width: screenWidth * 0.1,
                      height: screenHeight * 0.06),
                  SizedBox(
                    width: screenWidth * 0.02,
                  ),
                  MyButtonStyle(
                      text: "Add ", width: 200, height: 50, onTap: () {})
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Container(
              color: Color.fromARGB(255, 218, 208, 69),
              height: screenHeight * 0.45,
              width: screenWidth,
              child: ListView(
                children: [
                  BillEntry(
                      serialNumber: 1,
                      itemName: "Paracetamol",
                      price: 10,
                      quantity: 2,
                      total: 20),
                  BillEntry(
                      serialNumber: 2,
                      itemName: "Paracetamol",
                      price: 10,
                      quantity: 2,
                      total: 20),
                  BillEntry(
                      serialNumber: 3,
                      itemName: "Paracetamol",
                      price: 10,
                      quantity: 2,
                      total: 20),
                  BillEntry(
                      serialNumber: 4,
                      itemName: "Paracetamol",
                      price: 10,
                      quantity: 2,
                      total: 20),
                  BillEntry(
                      serialNumber: 5,
                      itemName: "Paracetamol",
                      price: 10,
                      quantity: 2,
                      total: 20),
                  BillEntry(
                      serialNumber: 6,
                      itemName: "Paracetamol",
                      price: 10,
                      quantity: 2,
                      total: 20),
                  BillEntry(
                      serialNumber: 7,
                      itemName: "Paracetamol",
                      price: 10,
                      quantity: 2,
                      total: 20),
                  BillEntry(
                      serialNumber: 8,
                      itemName: "Paracetamol",
                      price: 10,
                      quantity: 2,
                      total: 20),
                  BillEntry(
                      serialNumber: 9,
                      itemName: "Paracetamol",
                      price: 10,
                      quantity: 2,
                      total: 20),
                  BillEntry(
                      serialNumber: 10,
                      itemName: "Paracetamol",
                      price: 10,
                      quantity: 2,
                      total: 20),
                ],
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
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
                      controller: _name_controller,
                      width: screenWidth * 0.2,
                      height: screenHeight * 0.06),
                  SizedBox(
                    width: screenHeight * 0.1,
                  ),
                  MyButtonStyle(
                      text: "Give Discount",
                      width: screenWidth * 0.1,
                      height: screenHeight * 0.07,
                      onTap: () {}),
                  SizedBox(
                    width: screenHeight * 0.35,
                  ),
                  MyButtonStyle(
                      text: "Generate Bill",
                      width: 200,
                      height: 50,
                      onTap: () {}),
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
