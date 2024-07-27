import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:provider/provider.dart';
import 'package:weather_forecasting/providers/weather_provider.dart';
import 'package:weather_forecasting/screens/home_screen.dart';
import 'package:weather_forecasting/models/weather_model.dart';

// Create a mock class for WeatherProvider
class MockWeatherProvider extends Mock implements WeatherProvider {}

void main() {
  testWidgets('HomeScreen displays weather and handles search', (WidgetTester tester) async {
    final mockWeatherProvider = MockWeatherProvider();

    when(mockWeatherProvider.isLoading).thenReturn(false);
    when(mockWeatherProvider.currentWeather).thenReturn(WeatherModel(
      temp: 25.0,
      description: 'Clear sky',
      humidity: 60,
      windSpeed: 5.0,
    ));

    await tester.pumpWidget(
      ChangeNotifierProvider<WeatherProvider>.value(
        value: mockWeatherProvider,
        child: MaterialApp(home: HomeScreen()),
      ),
    );

    // Verify that the weather temperature is displayed
    expect(find.text('25.0°C'), findsOneWidget);
    expect(find.text('Clear sky'), findsOneWidget);

    // Simulate entering text and submitting the search
    await tester.enterText(find.byType(TextField), 'London');
    await tester.tap(find.byType(TextField));
    await tester.pump();

    // Verify that the search functionality was triggered
    verify(mockWeatherProvider.fetchWeatherByCity('London')).called(1);
  });
}
