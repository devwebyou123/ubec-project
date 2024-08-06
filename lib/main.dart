import 'package:cebu_project/pages/user/login/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Metro Cebu Policemen Multipurpose Cooperative (MCPMC)",
      home: LoginPage(),
    );
  }
}