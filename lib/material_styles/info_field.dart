import 'package:flutter/material.dart';

class InfoField extends StatelessWidget {
  final String field;
  final String value;
  const InfoField({super.key,
   required this.field,
    required this.value});

  @override
  Widget build(BuildContext context) {
    return   LayoutBuilder(
      builder: (context, constraints) {
        print(constraints.maxWidth);
        print(constraints.maxHeight);
        return SizedBox(
                            width: constraints.maxWidth  ,
                            height: constraints.maxHeight ,
                            child: Column(
                              children: [
                                const SizedBox(height: 5,),
                                
                                SizedBox(
                                  width: constraints.maxWidth * 0.98,
                                  height: constraints.maxHeight*0.9,
                                  
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width:  constraints.maxWidth * 0.25,
                                        height:  constraints.maxHeight *0.9,
                                       

                                        child: Text(
                                          field,

                                          style: const TextStyle(
                                            color: Color.fromARGB(221, 56, 56, 56),
                                            fontSize: 20,



                                          ),
                                          
                                          ),
                                      ),


                                      const SizedBox(width: 5,),
                                      SizedBox(
        
                                        width:  constraints.maxWidth * 0.71,
                                        height:  constraints.maxHeight * 0.9,
                                        
                                          child: Text(
                                          value,

                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromARGB(255, 39, 3, 141),
                                            fontSize: 20,



                                          ),
                                          
                                          ),
                                      )
                                    ],
                                  ),
                                ),
                              ]
                            ),
        );
      }
    );
                        
                      
  }
}