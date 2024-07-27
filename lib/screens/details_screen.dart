import 'package:flutter/material.dart';
import '../models/weather_model.dart';

class DetailsScreen extends StatelessWidget {
  final WeatherModel weather;

  DetailsScreen({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${weather.temp}°C',
              style: TextStyle(fontSize: 32),
            ),
            Text(
              weather.description,
              style: TextStyle(fontSize: 24),
            ),
            Text(
              'Humidity: ${weather.humidity}%',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              'Wind Speed: ${weather.windSpeed} m/s',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
