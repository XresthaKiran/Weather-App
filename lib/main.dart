import 'package:flutter/material.dart';
import 'package:weather_app/screen/help_screen.dart';
import 'package:weather_app/screen/home_screen.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'WeatherForecast',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const HelpScreen(),
    );
  }
}