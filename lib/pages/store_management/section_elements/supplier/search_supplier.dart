import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class SearchSupplier extends StatelessWidget {

  const SearchSupplier({super.key});

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    return Container(

      width: screenSize.width,
      height: 50,
      color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          SizedBox(
           width: 50,
            height: 40,
            child: TextField(
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                hintText: "ID",
                
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                  ),
                ),
              ),
            ),
          ),

          
          const SizedBox(
            width: 125,
            height: 40,
            child: TextField(
              
              decoration: InputDecoration(
                hintText: "First Name",
                
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                  ),
                ),
              ),
            ),
          ),

 const SizedBox(
   width: 125,
   height: 40,
   child: TextField(
    
     decoration: InputDecoration(
       hintText: "LastName",
       
       border: OutlineInputBorder(
         borderSide: BorderSide(
           width: 2,
         ),
       ),
     ),
   ),
 ),


const SizedBox(
   width: 200,
   height: 40,
   child: TextField(

     decoration: InputDecoration(
       hintText: "Distributor Name",
       
       border: OutlineInputBorder(
         borderSide: BorderSide(
           width: 2,
         ),
       ),
     ),
   ),
 ),

const SizedBox(
   width: 300,
   height: 40,
   child: TextField(
    
     decoration: InputDecoration(
       hintText: "Distributor Address",
       
       border: OutlineInputBorder(
         borderSide: BorderSide(
           width: 2,
         ),
       ),
     ),
   ),
 ),


 const SizedBox(
   width: 150,
   height: 40,
   child: TextField(
  
     decoration: InputDecoration(
       hintText: "Email",
       
       border: OutlineInputBorder(
         borderSide: BorderSide(
           width: 2,
         ),
       ),
     ),
   ),
 ),

 SizedBox(
   width: 125,
   height: 40,
   child: TextField(
     inputFormatters: [FilteringTextInputFormatter.digitsOnly],
     decoration: const InputDecoration(
       hintText: "Phone Number",
       
       border: OutlineInputBorder(
         borderSide: BorderSide(
           width: 2,
         ),
       ),
     ),
   ),
 ),

 IconButton(onPressed: (){}, icon: const Icon(Icons.search))


        ],
        )

        


    );
  }
}