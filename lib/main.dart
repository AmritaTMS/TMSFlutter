import 'package:TMS/Views/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Root());
}

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TMS | Timesheet Management System for Institutions',
      theme: ThemeData(
        //need to add fonts
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}
