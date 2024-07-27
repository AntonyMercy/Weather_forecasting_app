import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_forecasting/providers/weather_provider.dart';
import 'package:weather_forecasting/services/weather_service.dart';
import 'package:weather_forecasting/models/weather_model.dart';

// Create a mock class for WeatherService
class MockWeatherService extends Mock implements WeatherService {}

void main() {
  late WeatherProvider weatherProvider;
  late MockWeatherService mockWeatherService;

  setUp(() {
    mockWeatherService = MockWeatherService();
    weatherProvider = WeatherProvider(weatherService: mockWeatherService);
  });

  test('Fetch weather by city', () async {
    final weather = WeatherModel(
      temp: 25.0,
      description: 'Clear sky',
      humidity: 60,
      windSpeed: 5.0,
    );

    when(mockWeatherService.getWeatherByCity('London'))
        .thenAnswer((_) async => weather);

    await weatherProvider.fetchWeatherByCity('London');

    expect(weatherProvider.currentWeather, isNotNull);
    expect(weatherProvider.currentWeather!.temp, 25.0);
    expect(weatherProvider.currentWeather!.description, 'Clear sky');
  });

  test('Fetch weather by location', () async {
    final weather = WeatherModel(
      temp: 20.0,
      description: 'Rainy',
      humidity: 80,
      windSpeed: 10.0,
    );

    when(mockWeatherService.getWeather(51.5074, -0.1278))
        .thenAnswer((_) async => weather);

    await weatherProvider.fetchWeather(51.5074, -0.1278);

    expect(weatherProvider.currentWeather, isNotNull);
    expect(weatherProvider.currentWeather!.description, 'Rainy');
  });
}
