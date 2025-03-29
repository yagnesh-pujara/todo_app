import 'package:flutter/material.dart';
import 'package:todo_app/screens/home/home_screen.dart';
import 'package:todo_app/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.blueColor),
      ),
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
