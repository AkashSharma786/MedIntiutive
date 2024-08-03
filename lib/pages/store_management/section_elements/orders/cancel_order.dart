import 'package:flutter/material.dart';


class CancelOrder extends StatelessWidget {

  const CancelOrder({super.key});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return SizedBox(

      width: screenSize.width,
      height: 50,
     
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(child: const Text("Select Order"), onPressed: (){} ),
        ],
      ),


    );
  }
}