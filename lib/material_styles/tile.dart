import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/material_styles/custom_text_field.dart';

class Tile extends StatelessWidget {
  final Map<String, Object?> tableData;
  final Map<String, Object?>? showData;

  Icon? icon;
  Function? deleteFunction;
  Function? editFunction;
  double? width;
  double? height;
  String? table;
  Function? dataAndIntegerFunction;
  TextEditingController quantityController  = TextEditingController() ;
  int? textField;

  Tile(
      {super.key,
      required this.tableData,
      this.icon,
      this.editFunction,
      this.deleteFunction,
      this.table,
      this.width,
      this.height,
      this.showData,
      this.dataAndIntegerFunction,
      this.textField,
      });

   

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    Map<String, Object?> data = tableData;
    int length = tableData.length;
    List<String> keys = tableData.keys.toList();
    if (showData != null) {
      length = showData!.length;
      data = showData!;
      keys = showData!.keys.toList();
    }

    

    return Column(
      children: [
        Container(
          width: width ?? screenSize.width,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
                color: Colors.black, width: 1, style: BorderStyle.solid),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Builder(builder: (context) {
                print(data);
                return Container(
                  width: ((width) ?? (screenSize.width) * 0.8) * 0.7,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: length,
                    itemBuilder: (context, index) {
                      return Row(
                        children: [
                           SizedBox(
                            width: screenSize.width * 0.03,
                          ),
                          Text(data[keys[index]].toString()),
                         
                        ],
                      );
                    },
                  ),
                );
              }),

              Builder(builder: (context) {
                if (textField != null) {
                  return CustomTextField(
                            hintText: "1",
                            controller: quantityController,
                            width: 60,
                            height: 40,
                           
              

                          );
                } else {
                  return Container();
                }
              }),


              Builder(builder: (context) {
                if (icon != null) {
                  return IconButton(
                    icon: icon!,
                    onPressed: () {
                      if (editFunction != null) {
                        editFunction!(tableData);
                      }
                      if (deleteFunction != null) {
                        deleteFunction!(tableData);
                      }

                      if (dataAndIntegerFunction != null) {
                        if(textField != null){
                          if(quantityController.text.isEmpty){
                            return;
                          }
                          else
                          dataAndIntegerFunction!(
                            tableData, int.parse(quantityController.text));
                        } else {
                          dataAndIntegerFunction!(
                            tableData, showData!["quantity"]);
                        }

                      }
                    },
                  );
                } else {
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
