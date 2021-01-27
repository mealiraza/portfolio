import 'package:flutter/material.dart';
import 'package:my_personal_portfolio/components/side_navigation_drawer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: Demo(),
      title: "Ali Raza",
    );
  }
}

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: new Stack(
        children: [
          Container(
            color: Colors.red,
          ),
          NavigationDrawer(),
        ],
      ),
    ));
  }
}
