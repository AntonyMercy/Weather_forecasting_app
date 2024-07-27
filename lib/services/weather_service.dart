import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/weather_model.dart';

class WeatherService {
  final String _baseUrl = 'http://localhost:5000/api/weather'; // Replace with your backend URL

  Future<WeatherModel> getWeather(double lat, double lon) async {
    final response = await http.get(Uri.parse('$_baseUrl/current?lat=$lat&lon=$lon'));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }

  Future<WeatherModel> getWeatherByCity(String city) async {
    final response = await http.get(Uri.parse('$_baseUrl/current?city=$city'));
    if (response.statusCode == 200) {
      return WeatherModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load weather');
    }
  }
}
