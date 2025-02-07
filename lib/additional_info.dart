import 'package:flutter/material.dart';
// import 'package:weather_icons/weather_icons.dart';


class AdditionalInfomation extends StatelessWidget {
  const AdditionalInfomation({
    super.key,
    required this.humidityLevel,
    required this.windSpeed,
    required this.pressure,
  });

  final int humidityLevel;
  final double windSpeed;
  final int pressure;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
    
        // HUMIDITY
        Center(
          child: SizedBox(
            width: 130,
            height: 130,
            child: Column(
              
              children: [
    
                // Humidity Icon
                 Padding(
                   padding: const EdgeInsets.only(top: 16.0),
                   child: Icon(Icons.water_drop, color: Colors.white, size: 33),
                 ),
    
                // Humidity Text
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Humidity',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ),
    
                // Value 
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '$humidityLevel',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'Teko'
                    ),
                  ),
                ),
                
                
              ],
            ),
          ),
        ),
    
    
    
        // WIND SPEED
        Center(
          child: SizedBox(
            width: 130,
            height: 130,
            child: Column(
              
              children: [
    
                // Wind Speed Icon
                 Padding(
                   padding: const EdgeInsets.only(top: 16.0),
                   child: Icon(Icons.air, color: Colors.white, size: 33),
                 ),
    
                // Wind Speed Text
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Wind Speed',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ),
    
                // Value 
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '$windSpeed',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'Teko'
                    ),
                  ),
                ),
                
              ],
            ),
          ),
        ),
    
        // pressure
        Center(
          child: SizedBox(
            width: 130,
            height: 130,
            child: Column(
              
              children: [
    
                // pressure Icon
                 Padding(
                   padding: const EdgeInsets.only(top: 16.0),
                   child: Icon(Icons.filter_vintage, color: Colors.white, size: 33),
                 ),
    
                // // pressure Text
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    'Pressure',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ),
    
                // Value 
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    '$pressure',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.w100,
                      fontFamily: 'Teko'
                    ),
                  ),
                ),
    
              ],
            ),
          ),
        )
      ],
    );
  }
}
