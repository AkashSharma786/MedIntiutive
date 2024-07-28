import 'package:flutter/material.dart';
import 'package:flutter_application_1/material_styles/navigation_rail.dart';

class MyHomepage extends StatelessWidget {
  const MyHomepage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Row(
        children: [MyNavigationRail()],
      ),
    );
  }
}
