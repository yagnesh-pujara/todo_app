import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/database/hive_service.dart';
import 'package:todo_app/provider/theme_provider.dart';
import 'package:todo_app/provider/todo_provider.dart';
import 'package:todo_app/screens/home/home_screen.dart';
import 'package:todo_app/utils/utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService().init();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => TodoProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Todo App',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeProvider.themeMode,
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
