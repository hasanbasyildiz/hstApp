import 'package:apphst/api/WeatherProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PageThree extends StatelessWidget {
  const PageThree({super.key});

  @override
  Widget build(BuildContext context) {
    final weatherProvider = Provider.of<WeatherProvider>(context);

    return Scaffold(

      body: Center(
        child: weatherProvider.weatherData != null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'İzmir hava durumu: ${(weatherProvider.weatherData!['main']['temp'] - 273.15).toInt()} Derece',
              style: TextStyle(fontSize: 20),
            ),
          ],
        )
            : weatherProvider.errorMessage!= null
            ? Text(
          weatherProvider.errorMessage!,
          style: TextStyle(color: Colors.red, fontSize: 16),
        )
            : CircularProgressIndicator(),
      ),
    );
  }
}

