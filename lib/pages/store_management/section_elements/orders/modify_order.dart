import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ModifyOrder extends StatelessWidget {

  ModifyOrder({super.key});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Container(

      width: screenSize.width,
      height: 50,
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(child: Text("Select Order"), onPressed: (){} ),
        ],
      )


    );
  }
}