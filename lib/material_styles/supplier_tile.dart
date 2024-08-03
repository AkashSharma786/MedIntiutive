import 'package:flutter/material.dart';

class SupplierTile extends StatelessWidget{
  final Map<String, Object?> tableData;
  final List<String> fieldList;
  SupplierTile({super.key, required this.tableData , required this.fieldList});


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Column(
                    children: [
                      SizedBox(height: screenSize.height *0.02,),
                      Container(
                        width: screenSize.width-100,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black,
                          width: 1,
                          style: BorderStyle.solid
                          ),

                          borderRadius: BorderRadius.circular(10),
                        ),
                        
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(width: screenSize.width*0.01,),
                            
                            Text("${tableData[fieldList[0]]}"),
                            
                            Text("${tableData[fieldList[1]]}"),
                            
                            Text("${tableData[fieldList[2]]}"),
                            
                            Text("${tableData[fieldList[3]]}"),
                            
                            Text("${tableData[fieldList[4]]}"),
                          ],
                        ),
                      ),
                    ],
                  );
  }
}