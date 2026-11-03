
import 'package:flutter/material.dart';
import 'widgets/dashboard_layout.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'NOEM NETRA Admin Dashboard',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 18, 224, 62),
        ),
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      home: const DashboardLayout(),
    );
  }
}
