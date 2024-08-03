import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyBillingPage extends StatefulWidget {
  const MyBillingPage({super.key});

  @override
  State<MyBillingPage> createState() => _MyBillingPageState();
}

class _MyBillingPageState extends State<MyBillingPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.black,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width * 0.22,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          const Row(
                            children: [
                              Icon(
                                Icons.receipt_long,
                                color: Colors.black,
                                size: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 8, 0, 0),
                                child: Text(
                                  "Invoice No:",
                                  style: TextStyle(
                                      fontFamily: "Consolas",
                                      fontWeight: FontWeight.w900,
                                      fontSize: 20),
                                ),
                              ),
                              Spacer(),
                              // Actual invoice data will be displayed here
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 8, 8, 0),
                                child: Text(
                                  "#567/02082024",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20,
                                      fontFamily: "Consolas",
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ],
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            // developed team name
                            children: [
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Text("[Team Pixel Squad]",
                                    style: TextStyle(
                                        fontFamily: "Consolas",
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w900)),
                              )
                            ],
                          ),
                          const Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.point_of_sale_outlined,
                                color: Colors.black,
                                size: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                                child: Text("Bill From:",
                                    style: TextStyle(
                                        fontFamily: "Consolas",
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900)),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          // create a drop down button for selecting the cashiers
                          DropdownButtonFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              labelText: "Select the Cashier",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: "Consolas",
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 1,
                                child: Text("Ayan Haldar"),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text("Aditya Kumar"),
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Text("Akash Sharma"),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                          const SizedBox(
                            height: 16,
                          ),

                          // Shop's Address
                          const Row(
                            children: [
                              Icon(
                                Icons.store,
                                color: Colors.black,
                                size: 30,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Text(
                                  "Shop's Address",
                                  style: TextStyle(
                                      fontFamily: "Consolas",
                                      color: Colors.black,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: Colors.red,
                                size: 30,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Text(
                                  "No. 1, Basanti Highwasy,\nBrahmapur Government Colony,\nBagdoba, Kolkata,\nHadia, West Bengal 700150",
                                  style: TextStyle(
                                      fontFamily: "Consolas",
                                      color: Colors.black,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          // Issued  on

                          Container(),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      width: MediaQuery.of(context).size.width * 0.22,
                      height: MediaQuery.of(context).size.height * 0.4,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.description_sharp,
                                  color: Colors.black, size: 30),
                              Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(8, 8, 0, 8),
                                  child: const Text("Details of Invoice:",
                                      style: TextStyle(
                                          fontFamily: "Consolas",
                                          color: Colors.black,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16))),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                                child: Text(
                                    "[Date: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                                    style: const TextStyle(
                                        fontFamily: "Consolas",
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal)),
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                                child: Text(
                                    "Time: ${DateTime.now().hour}:${DateTime.now().minute}:${DateTime.now().second}]",
                                    style: const TextStyle(
                                        fontFamily: "Consolas",
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal)),
                              ),
                            ],
                          ),
                          const Divider(
                            color: Colors.black,
                            thickness: 2,
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text("Bill To:",
                                    style: TextStyle(
                                        fontFamily: "Consolas",
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900)),
                              ],
                            ),
                          ),
                          const TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              labelText: "Customer Name",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: "Consolas",
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.credit_card_outlined,
                                  color: Colors.black,
                                  size: 30,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Text("Payment Type:",
                                    style: TextStyle(
                                        fontFamily: "Consolas",
                                        color: Colors.black,
                                        fontWeight: FontWeight.w900)),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          DropdownButtonFormField(
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(16)),
                              ),
                              labelText: "Select the Payment Type",
                              labelStyle: TextStyle(
                                color: Colors.grey,
                                fontFamily: "Consolas",
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            items: const [
                              DropdownMenuItem(
                                value: 1,
                                child: Text("Cash"),
                              ),
                              DropdownMenuItem(
                                value: 2,
                                child: Text("Card"),
                              ),
                              DropdownMenuItem(
                                value: 3,
                                child: Text("UPI"),
                              ),
                            ],
                            onChanged: (value) {},
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.all(8),
                  width: MediaQuery.of(context).size.width * 0.45,
                  height: MediaQuery.of(context).size.height * 0.54,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              padding: const EdgeInsets.all(8),
              width: MediaQuery.of(context).size.width * 0.45,
              height: MediaQuery.of(context).size.height * 1,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("List of Items",
                      style: TextStyle(
                          fontFamily: "Consolas",
                          color: Colors.black,
                          fontWeight: FontWeight.w900,
                          fontSize: 16)),
                  SizedBox(
                    height: 8,
                  ),
                  // create a dynamic table for the items
                  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
