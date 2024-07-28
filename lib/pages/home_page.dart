import 'package:flutter/material.dart';




class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _views = [
    Center(child: Text('Home View')),
    Center(child: Text('Profile View')),
    Center(child: Text('Settings View')),
    Center(child: Text('Settings View')),
    Center(child: Text('Settings View')),
    Center(child: Text('Settings View')),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: <Widget>[
          NavigationRail(
            backgroundColor: Colors.green.shade700,

            groupAlignment: 0.0,
            indicatorColor: Colors.white,
            selectedIndex: _selectedIndex,
            leading: ElevatedButton(
                style: ButtonStyle(
                  elevation: WidgetStateProperty.all(10),
                  backgroundColor: WidgetStateProperty.all(Colors.white),
                ),

                onPressed: () {
                
                },

                child:
                    const Icon(Icons.person_2_outlined, color: Colors.black)),
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            destinations: [
              
              NavigationRailDestination(
                icon: const Icon(
                  Icons.home_max_outlined,
                  color: Colors.black,
                ),
                label:
                    const Text('Home', style: TextStyle(color: Colors.black)),
              ),


              const NavigationRailDestination(
                icon: Icon(
                  Icons.credit_card,
                  color: Colors.black,
                ),
                label: Text('Billing', style: TextStyle(color: Colors.black)),
              ),
              const NavigationRailDestination(
                icon: Icon(
                  Icons.storage,
                  color: Colors.black,
                ),
                label: Text('Database', style: TextStyle(color: Colors.black)),
              ),


              const NavigationRailDestination(
                icon: Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.black,
                ),
                label: Text('Order', style: TextStyle(color: Colors.black)),
              ),


              const NavigationRailDestination(
                icon: Icon(
                  Icons.money,
                  color: Colors.black,
                ),
                label: Text('Expenses', style: TextStyle(color: Colors.black)),
              ),


              const NavigationRailDestination(
                icon: Icon(
                  Icons.notification_add_outlined,
                  color: Colors.black,
                ),
                label:
                    Text('Notification', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
          Expanded(
            child: _views[_selectedIndex],
          ),
        ],
      ),
    );
  }
}