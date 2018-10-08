import "package:flutter/material.dart";

import "screens/home_screen.dart";

/// main function execution starts here
void main() {
  runApp(MyApp());
}

/// the root widget of our app with material app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // The MaterialApp widget
    return MaterialApp(
      title: "Changefly Animations",
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomeScreen(),
    );
  }
}

