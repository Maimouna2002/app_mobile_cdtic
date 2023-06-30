import 'package:e_learnig_clone/root_app.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'WorkSans'),
      debugShowCheckedModeBanner: false,
      home: RootApp(),
    );
  }
}
