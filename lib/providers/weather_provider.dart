import 'package:flutter/material.dart';
import '../services/weather_service.dart';
import '../models/weather_model.dart';

class WeatherProvider with ChangeNotifier {
  final WeatherService _weatherService;

  WeatherProvider({WeatherService? weatherService})
      : _weatherService = weatherService ?? WeatherService();

  WeatherModel? _currentWeather;
  bool _isLoading = false;

  WeatherModel? get currentWeather => _currentWeather;
  bool get isLoading => _isLoading;

  Future<void> fetchWeather(double lat, double lon) async {
    _isLoading = true;
    notifyListeners();
    try {
      _currentWeather = await _weatherService.getWeather(lat, lon);
    } catch (e) {
      // Handle error
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchWeatherByCity(String city) async {
    _isLoading = true;
    notifyListeners();
    try {
      _currentWeather = await _weatherService.getWeatherByCity(city);
    } catch (e) {
      // Handle error
    }
    _isLoading = false;
    notifyListeners();
  }
}
