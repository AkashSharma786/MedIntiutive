import 'package:flutter/material.dart';

class OrdersTile extends StatelessWidget{
  final Map<String, Object?> tableData;
  final List<String> fieldList;
  Icon? icon;
  Function? function;
  OrdersTile({super.key, required this.tableData , required this.fieldList , this.icon , this.function});


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
                            
                    
                            Text("${tableData[fieldList[3]]}"),
                            
                            Text("${tableData[fieldList[6]]}"), 
                            Builder(builder: (context){
                              if(icon != null){
                                return IconButton(
                                  onPressed: (){
                                    function!(tableData);
                                  },
                                  icon: icon!,
                                );
                              }
                              return Container();
                            })  
                          
                          ],
                        ),
                      ),
                    ],
                  );
  }
}