import 'package:flutter/material.dart';
import 'package:vino_contact/src/pages/contact_list_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contact App',
      home: ContactListScreen(),
    );
  }
}
