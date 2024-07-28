import 'package:flutter/material.dart';
import 'package:flutter_application_1/material_styles/custom_text_field.dart';
import '../material_styles/button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children:[ 
          SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height,
          
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                const Text(

                  "Login",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontFamily: "Arial",
                    color: Colors.deepPurple,
                  ),
                  ),
                   SizedBox(height: MediaQuery.of(context).size.height * 0.03,),


          
                
       
                    CustomTextField(hintText: "someone@email.com",
                    controller: _usernameController,
                    width: 400,
                    height: 50,
                    myLabel: "Email",
                    ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                 
                CustomTextField(hintText: "min 8 characters",
                     controller: _passwordController ,
                      width: 400,
                       height: 50,
                       myLabel: "Password",
                     
                  
                ),

                 SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                
                MyButtonStyle(text: "Login",
                 width: 200,
                  height: 50,
                  onTap: (){},
                  ), 
                
              ],
            ),
          ),
        ),


        Container(
          
          width: MediaQuery.of(context).size.width * 0.4,
          height: MediaQuery.of(context).size.height,
          
          
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login.png"),
              fit: BoxFit.fitWidth,
              opacity: 0.5,
            ),
            
            borderRadius: BorderRadius.only(

            bottomLeft: Radius.circular(100),

              
            ),
            gradient: LinearGradient(
              colors: [Color.fromARGB(255, 39, 3, 141), Color.fromARGB(248, 91, 231, 250)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            
           
          ),
          

          
          child: ShaderMask(
            shaderCallback: (bounds) => const LinearGradient(
              colors:  [ Color.fromARGB(248, 91, 231, 250), Color.fromARGB(255, 39, 3, 141), Color.fromARGB(255, 243, 164, 17)],
              
              ).createShader(
                bounds
                ),


            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Text(
                  "MedIntiutive",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.normal,
                    fontStyle: FontStyle.italic,
                    fontFamily: "",
                    color: Colors.orange
                    
                    
                    
                    
                  )
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.05,)



              ],
            ),
          ),
        )
        
        
        ]
      )
      
    );
  }
}