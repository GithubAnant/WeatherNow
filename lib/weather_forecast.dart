import 'package:flutter/material.dart';
import 'package:weather_app/weather_card_time.dart';

class WeatherForecast extends StatelessWidget {
  const WeatherForecast({
    super.key,
    required this.temperature,
    required this.unitTemperature,
  });

  final double temperature;
  final String unitTemperature;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Row(
          children: [

            WeatherCard(
              time:  '00:00',
              icon: Icons.cloud,
              temperature: temperature,
              unitTemperature: unitTemperature
             ),
    
            WeatherCard(
              time: '03:00',
              icon: Icons.cloud,
              temperature: temperature+1,
              unitTemperature: unitTemperature
             ),
    
            WeatherCard(
              time: '06:00',
              icon: Icons.cloud,
              temperature: temperature+3,
              unitTemperature: unitTemperature
             ),
    
            WeatherCard(
              time: '09:00',
              icon: Icons.cloud,
              temperature: temperature+7,
              unitTemperature: unitTemperature
             ),
    
            WeatherCard(
              time:  '12:00',
              icon: Icons.cloud,
              temperature: temperature+13,
              unitTemperature: unitTemperature
             ),
    
            WeatherCard(
              time:  '15:00',
              icon: Icons.cloud,
              temperature: temperature+6,
              unitTemperature: unitTemperature
             ),
    
            WeatherCard(
              time:  '18:00',
              icon: Icons.cloud,
              temperature: temperature+5,
              unitTemperature: unitTemperature
             ),
    
            WeatherCard(
              time:  '21:00',
              icon: Icons.cloud,
              temperature: temperature+1,
              unitTemperature: unitTemperature
             ),
    
          ],
        ),
      ),
    );
  }
}