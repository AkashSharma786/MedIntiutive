import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/profile_page.dart';

class DashBoard extends StatefulWidget {

  const DashBoard({super.key});
  @override
  _DashBoardState createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  int profilePageDisplayed = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Dashboard'),
        actions: [ 

          IconButton(
            onPressed:(){
              if(profilePageDisplayed == 1){
                setState(() {
                  profilePageDisplayed = 0;
                });
              }
              else
              setState(() {
                profilePageDisplayed = 1;
              });
            },
            icon:  Icon(Icons.person),

          ),
         
         
          SizedBox(width: 50,),
        ],
        
        
      ),
      body: Container(


        child: Builder(
          builder: (context) {
            switch(profilePageDisplayed){
              case 0:
                return Center(
                  child: Text('Welcome to the Dashboard!'),
                );
              default:
                return Profile();
            }
            
          }
        ),


      ),
    );
  }
}