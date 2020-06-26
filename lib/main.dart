import 'package:flutter/material.dart';
import 'package:restaurants_finder/Screens/wrapper.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Restaurants Finder",
      home: Wrapper(),
      color: Colors.green,
    );
  }
}