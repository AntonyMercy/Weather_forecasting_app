import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecasting/providers/weather_provider.dart';
import 'package:weather_forecasting/screens/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => WeatherProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
      // Add routes for better navigation handling
      routes: {
        '/home': (context) => HomeScreen(),
        // Define additional routes here
      },
    );
  }
}
