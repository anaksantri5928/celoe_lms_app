import 'package:flutter/material.dart';
import 'package:celoe_lms_app/pages/login_page.dart';
import 'package:celoe_lms_app/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const LoginPage(),
      routes: {'/home': (context) => const HomePage()},
    );
  }
}
