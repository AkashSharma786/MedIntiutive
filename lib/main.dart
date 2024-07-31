import 'package:flutter/material.dart';
import 'pages/profile_page.dart';

import 'package:flutter_application_1/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Navigation Rail Example',
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        highlightColor: const Color.fromARGB(255, 119, 3, 252),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
