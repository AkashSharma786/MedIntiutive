import 'package:flutter/material.dart';

class Tile extends StatelessWidget{
  final Map<String, Object?> tableData;
 
  Icon? icon;
  Function? deleteFunction;
  Function? editFunction;
  double? width;
  double? height;
  String? table;
  Tile({super.key,
   required this.tableData,
  
    this.icon,
    this.editFunction,
    this.deleteFunction,
    this.table,
    this.width,
    this.height
    
    });


  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    List<String> keys = tableData.keys.toList();
    return Column(
                    children: [
                     

                      Container(
                        width: width?? screenSize.width,
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
                           
                            Builder(builder: (context){

                              int length = tableData.length;
                              return Container(
                                width: ((width) ?? (screenSize.width)*0.8)*0.9,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: length,
                                  itemBuilder: (context, index){
                                    return Row(
                                      children: [
                                       
                                        Text(tableData[keys[index]].toString()),
                                         SizedBox(width: screenSize.width*0.05,),
                                      ],
                                    );
                                  },
                                ),
                              );
                            }),
                            
                        

                            Builder(builder: (context){
                              if(icon != null){
                                return IconButton(
                                  icon: icon!,
                                  onPressed: (){
                                    if(editFunction != null){
                                      editFunction!(tableData);
                                    }
                                    if(deleteFunction != null){
                                      deleteFunction!(tableData);
                                    }
                                  },
                                );
                              }else{
                                return Container();
                              }
                            })
                            
                            
                            
                          
                          ],
                        ),
                      ),
                    ],
                  );
  }
}