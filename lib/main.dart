import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'constants/colors.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(DevicePreview(enabled: true, builder: (context) => MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blinkit Bistro Clone',
      debugShowCheckedModeBanner: false, // Hide debug banner
      theme: ThemeData(
        primarySwatch: Colors.green, // Set primary color theme
        scaffoldBackgroundColor: AppColors.white, // Set default background
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.white,
          elevation: 0,
          iconTheme: IconThemeData(color: AppColors.black),
          titleTextStyle: TextStyle(
            color: AppColors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: HomeScreen(), // Our main screen
    );
  }
}
