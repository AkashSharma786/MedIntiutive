import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/database_page.dart';
import 'package:flutter_application_1/pages/home_page.dart';

class MyNavigationRail extends StatefulWidget {
  const MyNavigationRail({super.key});

  @override
  State<MyNavigationRail> createState() => _MyNavigationRailState();
}

class _MyNavigationRailState extends State<MyNavigationRail> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      backgroundColor: Colors.green.shade700,
      selectedIndex: _selectedIndex,
      groupAlignment: 0.0,
      indicatorColor: Colors.white,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      labelType: NavigationRailLabelType.all,
      // change the leading icon to your preference later
      leading: ElevatedButton(
          style: ButtonStyle(
            elevation: WidgetStateProperty.all(10),
            backgroundColor: WidgetStateProperty.all(Colors.white),
          ),
          onPressed: () {},
          child: const Icon(Icons.person_2_outlined, color: Colors.black)),
      destinations: <NavigationRailDestination>[
        NavigationRailDestination(
          icon: IconButton(
            icon: const Icon(
              Icons.home_max_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyHomepage()));
            },
          ),
          label: const Text('Home', style: TextStyle(color: Colors.black)),
        ),
        NavigationRailDestination(
          icon: IconButton(
            icon: const Icon(
              Icons.credit_card,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyHomepage()));
            },
          ),
          label: const Text('Billing', style: TextStyle(color: Colors.black)),
        ),
        NavigationRailDestination(
          icon: IconButton(
            icon: const Icon(
              Icons.storage,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyDataBase()));
            },
          ),
          label: const Text('Database', style: TextStyle(color: Colors.black)),
        ),
        NavigationRailDestination(
          icon: IconButton(
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyHomepage()));
            },
          ),
          label: const Text('Order', style: TextStyle(color: Colors.black)),
        ),
        NavigationRailDestination(
          icon: IconButton(
            icon: const Icon(
              Icons.money,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyHomepage()));
            },
          ),
          label: const Text('Expenses', style: TextStyle(color: Colors.black)),
        ),
        NavigationRailDestination(
          icon: IconButton(
            icon: const Icon(
              Icons.notification_add_outlined,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const MyHomepage()));
            },
          ),
          label: const Text('Notification', style: TextStyle(color: Colors.black)),
        ),
      ],
    );
  }
}
