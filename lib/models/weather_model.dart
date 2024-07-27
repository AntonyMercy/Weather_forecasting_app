
class WeatherModel {
  final double temp;
  final String description;
  final int humidity;
  final double windSpeed;

  WeatherModel({
    required this.temp,
    required this.description,
    required this.humidity,
    required this.windSpeed,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      temp: json['main']['temp'].toDouble(),
      description: json['weather'][0]['description'],
      humidity: json['main']['humidity'],
      windSpeed: json['wind']['speed'].toDouble(),
    );
  }
}
