import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_display.dart';
import '../services/geolocator_service.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Weather Forcast',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: Column(
        children: [
      Container(
        padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8.0), // Rounded corners
    ),
          child:TextField(
            decoration: InputDecoration(
              labelText: 'Enter location',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(16.0),
            ),
            onSubmitted: (value) async {
              await weatherProvider.fetchWeatherByCity(value);
            },
          ),
      ),
          Expanded(
            child: weatherProvider.isLoading
                ? Center(child: CircularProgressIndicator())
                : weatherProvider.currentWeather == null
                ? Center(child: Text('No data available'))
                : WeatherDisplay(weather: weatherProvider.currentWeather!),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final geolocatorService = GeolocatorService();
          final position = await geolocatorService.getCurrentLocation();
          await weatherProvider.fetchWeather(position.latitude, position.longitude);
        },
        child: Icon(Icons.my_location),
      ),
    );
  }
}
