// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/login_page.dart';

// class MyNavigationRail extends StatefulWidget {
//   const MyNavigationRail({super.key, required this.selected_index});

//   final int selected_index;

//   @override
//   State<MyNavigationRail> createState() => _MyNavigationRailState();
// }

// class _MyNavigationRailState extends State<MyNavigationRail> {

  
 
//   @override
//   Widget build(BuildContext context) {

     
//     return NavigationRail(
//       selectedIndex : widget.selected_index,
      


//       backgroundColor: Colors.green.shade700,
      
//       groupAlignment: 0.0,
//       indicatorColor: Colors.white,
//       onDestinationSelected: (int index) {
//         setState(() {
//           index = index;
//         });
//       },
//       labelType: NavigationRailLabelType.all,
//       // change the leading icon to your preference later
//       leading: ElevatedButton(
//           style: ButtonStyle(
//             elevation: WidgetStateProperty.all(10),
//             backgroundColor: WidgetStateProperty.all(Colors.white),
//           ),
//           onPressed: () {
//             Navigator.push(context,
//                 MaterialPageRoute(builder: (context) => const LoginPage()));
           
//           },
//           child: const Icon(Icons.person_2_outlined, color: Colors.black)),



//       destinations: <NavigationRailDestination>[

//         NavigationRailDestination(
//           icon: IconButton(
//             icon: const Icon(
//               Icons.home_max_outlined,
//               color: Colors.black,
//             ),
//             onPressed: () {
             
//             },


//           ),
//           label: const Text('Home', style: TextStyle(color: Colors.black)),
//         ),


//         const NavigationRailDestination(
          
//             icon: Icon(
//               Icons.credit_card,
//               color: Colors.black,
//             ),
           
          
//           label: Text('Billing', style: TextStyle(color: Colors.black)),
//         ),
//         const NavigationRailDestination(

//             icon: Icon(
//               Icons.storage,
//               color: Colors.black,
//             ),
           
          
//           label: Text('Database', style: TextStyle(color: Colors.black)),
//         ),

//         const NavigationRailDestination(
         
//             icon: Icon(
//               Icons.shopping_cart_outlined,
//               color: Colors.black,
//             ),
       
          
//           label: Text('Order', style: TextStyle(color: Colors.black)),
//         ),

//         const NavigationRailDestination(
       
//             icon: Icon(
//               Icons.money,
//               color: Colors.black,
//             ),
            
         
//           label: Text('Expenses', style: TextStyle(color: Colors.black)),
//         ),
        
//         const NavigationRailDestination(
        
//             icon: Icon(
//               Icons.notification_add_outlined,
//               color: Colors.black,
//             ),
           
          
//           label: Text('Notification', style: TextStyle(color: Colors.black)),
//         ),
//       ],
//     );
 
//   }
// }
