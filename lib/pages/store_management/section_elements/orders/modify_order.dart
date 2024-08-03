import 'package:flutter/material.dart';

class ModifyOrder extends StatelessWidget {

  const ModifyOrder({super.key});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return SizedBox(

      width: screenSize.width,
      height: 50,
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(child: const Text("Select Order"), onPressed: (){} ),
        ],
      )


    );
  }
}