import 'package:flutter/material.dart';
import 'package:order_pizza/data/pizza_data.dart';
import 'package:order_pizza/screens/home_screen.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final pizza = Pizza.pizza;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(pizza: pizza),
    );
  }
}
