import 'package:flutter/material.dart';

import 'home/home_page.dart';

class PersonCalculatorApp extends StatelessWidget {
  const PersonCalculatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Person Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      home: HomePage(),
    );
  }
}
