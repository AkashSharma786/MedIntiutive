import 'package:flutter/material.dart';
import 'package:flutter_application_1/material_styles/button.dart';
import 'package:flutter_application_1/material_styles/info_field.dart';

class Profile extends StatefulWidget {
  const Profile(
      {super.key,
      this.name,
      this.address,
      this.phone,
      this.email,
      this.shopName});

  final String? name;
  final String? address;
  final String? phone;
  final String? email;
  final String? shopName;


  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

   
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight =MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
     
      body: Container(

        width:screenWidth*0.8,
        height:screenHeight * 0.6 ,
        decoration: BoxDecoration(

          color: Colors.white,
            
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black
                    .withOpacity(0.3), 
                offset:
                    const Offset(1, 1), 
                blurRadius: 10, 
                spreadRadius: 2,
              )
            ],
          ),

          child: Column(
         
            children: [
              SizedBox(height: screenHeight*0.01),
              Container(
                width: screenWidth* 0.77,
                height: screenHeight * 0.1,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                colors: [Color.fromARGB(255, 39, 3, 141), Color.fromARGB(248, 91, 231, 250)],
                transform: GradientRotation(0.8),
              ),
              borderRadius: BorderRadius.circular(18.0),
             
                ),
              ),

              SizedBox(height: screenHeight*0.01),

              Container(
                width: screenWidth* 0.77,
                height: screenHeight * 0.45,
                decoration: const BoxDecoration(
                  color: Colors.white,
                
              
             
                ),

                child: Row(
                  children: [

                    ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: screenWidth* 0.55,
                      maxHeight: screenHeight * 0.44,


                    ),
                  child: Container(
                   
                    child: Column(
                      
                      children: [
                      Expanded(child: InfoField(field: " Name :", value: " Batman",)),
                    
                      Expanded(child: InfoField(field: " Shop Name :", value: "Batman's Shop",)),
                      Expanded(child: InfoField(field: " Address :", value: "Wayne Mnor, XYZ Mountain Cave Gotham, US",)),
                      Expanded(child: InfoField(field: "  Email :", value: "batman@batmail.com",)),
                      Expanded(child: InfoField(field: " Phone Number :", value: "986574359",)),
                    
                      
                      ],
                    ),
                  ),
                    
                     
                    
                   
    
                 ),

                  SizedBox(width: screenWidth*0.01),


                  Container(
                    width: screenWidth*0.2,
                    height: screenHeight*0.44,
                    color: Colors.amber,
                    
                    
                    
                    
                   child: Column(
                    children: [

                      Container(
                        width: screenWidth*0.16,
                        height: screenHeight*0.3,
                          decoration: const BoxDecoration(
                      image: DecorationImage(
                        opacity: 1,
                        image: AssetImage("assets/images/bat_man.jpg"),
                        )

                    )
                     
                        
                      ),

                      
                      
                    MyButtonStyle( text: "Edit",
                                       width: 200,
                                       height: 50,
                                       ),
                   
                   ],


                   ) 
                  
                  ),

              

                const SizedBox(width: 10),

                  
                
              
                  ],

                )
              ),


            
            ],
          ),

          
       
      ),
    );
  }
}
