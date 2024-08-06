import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomLabeledTextField extends StatelessWidget {
  String label;
  String hint;
  double? buttonWidth;
  double? buttonHeight;
  bool isInteger;
  bool isPrice;
  bool isNecessary;
  String? Function(String?)? inputValidator;
  TextEditingController widgetControl;

  CustomLabeledTextField(
      {super.key,
      required this.label,
      required this.hint,
      required this.widgetControl,
      this.buttonWidth,
      this.isInteger = false,
      this.isPrice = false,
      this.inputValidator,
      this.isNecessary = false,

      this.buttonHeight});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    if (buttonWidth == null) {
      buttonWidth = (screenSize.width * 0.25);
    }

    if (buttonHeight == null) {
      buttonHeight = 40;
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 17,
            ),
          ),
          Container(
            width: buttonWidth,
            height: buttonHeight,
            child: Builder(builder: (context) {
              if (isNecessary) {
                return TextFormField(
                    inputFormatters: (isInteger)
                        ? [FilteringTextInputFormatter.digitsOnly]
                        : (isPrice)
                            ? [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'[0-9]+(\.[0-9]{0,2})?'))
                              ]
                            : [],
                    controller: widgetControl,
                    autovalidateMode: AutovalidateMode.onUserInteraction,


                    validator: inputValidator,
                    
                   );
              } else
                return TextField(
                  inputFormatters: (isInteger)
                      ? [FilteringTextInputFormatter.digitsOnly]
                      : (isPrice)
                          ? [
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9]+(\.[0-9]{0,2})?'))
                            ]
                          : [],
                  controller: widgetControl,
                  decoration: InputDecoration(
                    hintText: hint,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2,
                      ),
                    ),
                  ),
                );
            }),
          ),
          SizedBox(
            height: screenSize.height * 0.01,
          )
        ],
      ),
    );
  }
}
