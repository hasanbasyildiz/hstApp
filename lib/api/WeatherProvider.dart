import 'package:apphst/api/WeatherModel.dart';
import 'package:flutter/foundation.dart';





class WeatherProvider extends ChangeNotifier {
  final String apiKey;
  final String city;

  WeatherProvider({required this.apiKey, required this.city}) {
    fetchWeatherData();
  }

  Map<String, dynamic>? _weatherData;
  Map<String, dynamic>? get weatherData => _weatherData;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  void fetchWeatherData() async {
    try {
      WeatherModel weatherModel = WeatherModel(apiKey: apiKey, city: city);
      _weatherData = await weatherModel.getWeatherData();
      _errorMessage = null;
      notifyListeners();
    } catch (e) {
      _weatherData = null;
      _errorMessage = 'Error fetching weather data: $e';
      notifyListeners();
    }
  }
}