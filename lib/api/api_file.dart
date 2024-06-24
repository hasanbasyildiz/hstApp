import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> fetchWeatherData(String city) async {
  final response = await http.get(Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?q=$city&mode=json&appid=1a44a64d98977ef9ce2dff1aee1350ed'));

  if (response.statusCode == 200) {
    return json.decode(response.body);
  } else {
    throw Exception('verileri alırken hata alındı ');
  }
}