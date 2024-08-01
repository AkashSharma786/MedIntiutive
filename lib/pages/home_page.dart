import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:flutter_application_1/pages/billing_page.dart';
import 'package:flutter_application_1/pages/dashboard_page.dart';

import 'package:flutter_application_1/pages/management_page.dart';
import 'package:flutter_application_1/pages/notification_page.dart';

import 'package:flutter_application_1/pages/order_page.dart';
import 'package:flutter_application_1/pages/profile_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _views = [
    const Center(child: DashBoard()),
    const Center(child: ManagementPage()),
    const Center(child: BillingPage() ),
    const Center(child: NotificationPage()),
    const Center(child: Text("Settings")),
  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            backgroundColor: Colors.black,
            groupAlignment: 1,
            indicatorColor: Colors.white,
            indicatorShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            selectedIndex: _selectedIndex,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.all,
            leading: Image.asset(
              "assets/images/cropped_logo.png",
              height: 80,
              width: 80,
            ),


            destinations: const [

              NavigationRailDestination(
                selectedIcon: Icon(
                  Icons.dashboard_customize_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                icon: Icon(
                  Icons.dashboard_customize_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                label: Text('Dashboard', style: TextStyle(color: Colors.white)),
              ),
              
                NavigationRailDestination(
                selectedIcon: Icon(
                  Icons.snippet_folder_sharp,
                  color: Colors.black,
                  size: 30,
                ),
                icon: Icon(
                  Icons.storage,
                  color: Colors.white,
                  size: 30,
                ),
                label: Text('Database', style: TextStyle(color: Colors.white)),
              ),



              NavigationRailDestination(
                selectedIcon: Icon(
                  Icons.library_add_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                icon: Icon(
                  Icons.article,
                  color: Colors.white,
                  size: 30,
                ),
                label: Text('Bill', style: TextStyle(color: Colors.white)),
              ),

              
              NavigationRailDestination(
                selectedIcon: Icon(
                  Icons.notifications_active_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                icon: Icon(
                  Icons.notifications_none_outlined,
                  color: Colors.white,
                  size: 30,
                ),
                label:
                    Text('Notification', style: TextStyle(color: Colors.white)),
              ),


              
            


              NavigationRailDestination(
                selectedIcon: Icon(
                  Icons.settings,
                  color: Colors.black,
                  size: 30,
                ),
                icon: Icon(
                  Icons.settings_applications,
                  color: Colors.white,
                  size: 30,
                ),
                label: Text('Settings', style: TextStyle(color: Colors.white)),
              ),

              
             
              
            ],

            trailing: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(icon:
               Icon(Icons.logout),
                onPressed: (){
                  exit(0);
                },
                ),

              
              
              ),
          ),
          Expanded(
            child: _views[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
