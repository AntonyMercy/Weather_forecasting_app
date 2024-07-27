import 'package:flutter/material.dart';
import '../models/weather_model.dart';
import '../screens/details_screen.dart';

class WeatherDisplay extends StatelessWidget {
  final WeatherModel weather;

  WeatherDisplay({required this.weather});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '${weather.temp}°C',
          style: TextStyle(fontSize: 32),
        ),
        Text(
          weather.description,
          style: TextStyle(fontSize: 24),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 7, // Replace with actual forecast data count
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Day $index'), // Replace with actual date
                subtitle: Text('Weather details'), // Replace with actual weather details
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailsScreen(weather: weather), // Pass correct weather data
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
