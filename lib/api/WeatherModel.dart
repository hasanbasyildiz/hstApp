import 'dart:convert';
import 'package:http/http.dart' as http;



class WeatherModel {
  final String apiKey;
  final String city;

  WeatherModel({required this.apiKey, required this.city});

  Future<Map<String, dynamic>> getWeatherData() async {
    final response = await http.get(
        Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load weather data');
    }
  }
}