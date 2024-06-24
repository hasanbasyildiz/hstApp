import 'package:flutter/material.dart';
import '../../api/api_file.dart';


class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  Map<String, dynamic> weatherData = {};
  bool isLoading = true;
  String errorMessage = '';

  @override
  void initState() {
    super.initState();
    fetchWeatherData('Istanbul').then((data) {
      setState(() {
        weatherData = data;
        isLoading = false;
      });
    }).catchError((e) {
      setState(() {
        errorMessage = 'Error: $e';
        isLoading = false;
      });
      print('Error: $e');
    });
  }

  @override
  Widget build(BuildContext context) {
    double? kelvin;
    double? celsius;
    if (weatherData.containsKey('main')) {
      kelvin = weatherData['main']['temp'];
      celsius = (kelvin! - 273.15);
    }

    return Scaffold(

      body: Center(
        child: isLoading
            ? CircularProgressIndicator()
            : errorMessage.isNotEmpty
            ? Text(
          errorMessage,
          style: TextStyle(color: Colors.red, fontSize: 16),
        )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Istanbul hava durumu: ${celsius?.toInt() } °C',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}