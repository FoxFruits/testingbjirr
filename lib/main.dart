import 'package:flutter/material.dart';
import 'room_types_2_menu.dart'; // Make sure this import matches your file name

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hotel Room Types',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: RoomType(), // Create an instance of RoomType
    );
  }
}