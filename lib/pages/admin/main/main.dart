import 'package:flutter/material.dart';
import '../Dashboard/dashboard_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Dashboard',
      theme: ThemeData.dark(),
      home: DashboardScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
