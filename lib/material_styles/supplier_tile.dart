import 'package:flutter/material.dart';

class SupplierTile extends StatelessWidget{
  final Map<String, Object?> tableData;
  final List<String> fieldList;
  double? tileWidth;
  double? tileHeight;
  SupplierTile({super.key,
   required this.tableData ,
    required this.fieldList,
        this.tileWidth,
        this.tileHeight
    });


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    if(tileWidth == null)
    {
      tileWidth = MediaQuery.of(context).size.width-100;
    }
    if(tileHeight == null)
    {
      tileHeight = 40;
    }
    return Column(
                    children: [
                      SizedBox(height: screenSize.height *0.02,),
                      Container(
                        width: tileWidth,
                        height: tileHeight,
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