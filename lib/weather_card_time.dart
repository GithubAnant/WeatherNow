import 'package:flutter/material.dart';

class WeatherCard extends StatelessWidget {
  final String time;
  final IconData icon;
  final double temperature;
  final String unitTemperature;

  const WeatherCard({
    Key? key,
    required this.time,
    required this.icon,
    required this.temperature,
    required this.unitTemperature,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      height: 130,
      child: Card(
        elevation: 6,
        margin: const EdgeInsets.only(left: 15),
        shadowColor: const Color.fromARGB(255, 22, 203, 203),
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  time,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Icon(icon, size: 40, color: const Color.fromARGB(255, 117, 175, 222)),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Text(
                  '${temperature.toStringAsFixed(1)}°$unitTemperature',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  } 
}
