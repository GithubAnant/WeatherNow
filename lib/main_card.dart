import 'package:flutter/material.dart';
import 'dart:ui';


class MainCard extends StatelessWidget {
  const MainCard({
    super.key,
    required this.temperature,
    required this.unitTemperature,
    required this.mainWeather,
    required this.mainWeatherIconData,
  });

  final double temperature;
  final String unitTemperature;
  final String mainWeather;
  final IconData? mainWeatherIconData;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(),
        child: SizedBox(
          width: 400,
          height: 260,
          child: Card(
            
            margin: EdgeInsets.only(top: 7,left: 15, right: 15, bottom: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            elevation: 7,
            shadowColor: const Color.fromARGB(255, 22, 203, 203),
          
            
            child: Center(
              child: Column(
                children: [
                          
                  // TEMPERATURE
                  Container(
                    margin: EdgeInsets.only(top: 28),
                    child: Text(
                      '${temperature.toStringAsFixed(1)}°$unitTemperature',
                      style: TextStyle(
                        fontSize:38,
                        fontWeight: FontWeight.bold,
                      ),
                      ),
                  ),
                          
                  // ICON DEPENDING ON WEATHER
                  Container(
                    margin: EdgeInsets.only(top: 18, bottom: 10),
                    child: Icon(mainWeatherIconData, size: 65, color: const Color.fromARGB(255, 255, 255, 255),),
                  ),
                          
                          
                  // TEXT ABOUT WEATHER
                  Container(
                    margin: EdgeInsets.only(top: 12, bottom: 20),
                    child: Text(
                      mainWeather,
                      style: TextStyle(
                        fontSize: 25
                      ),),
                  )
                          
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
