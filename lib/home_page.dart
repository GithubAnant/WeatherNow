import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/additional_info.dart';
import 'package:weather_app/main_card.dart';
import 'package:weather_app/weather_forecast.dart';
import 'package:weather_icons/weather_icons.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherAppHome extends StatefulWidget {
  const WeatherAppHome({super.key});

  @override
  State<WeatherAppHome> createState() => _WeatherAppHomeState();
}




class _WeatherAppHomeState extends State<WeatherAppHome> {

  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

List<String> cities = const [
  "Auckland", "Abu Dhabi", "Ahmedabad", "Amsterdam", "Athens", "Bangkok", "Barcelona", "Beijing", "Berlin", "Bogota",
  "Brisbane", "Buenos Aires", "Calgary", "Cape Town", "Caracas", "Cairo", "Chicago", "Dallas", "Delhi", "Dubai",
  "Houston", "Hong Kong", "Istanbul", "Jakarta", "Jaipur", "Johannesburg", "Kolkata", "Lagos", "Lisbon", "London",
  "Los Angeles", "Madrid", "Melbourne", "Mexico City", "Miami", "Moscow", "Montreal", "New York", "Osaka",
  "Ottawa", "Paris", "Phoenix", "Pune", "Rio de Janeiro", "Riyadh", "Rome", "San Antonio", "San Diego", "San Jose",
  "Sao Paulo", "Seoul", "Shanghai", "Santiago", "Singapore", "Surat", "Sydney", "Tel Aviv", "Tokyo",
  "Toronto", "Vancouver", "Vienna", "Wellington"
];


  double temperature = 0;
  String? cityName='London';
  String unitTemperature = 'C';
  bool activeButtonCelsius = true; 
  bool activeButtonFar = false; 
  int humidityLevel = 0;
  double windSpeed = 0;
  int pressure = 0;
  String apikey = '5a5d79a2b921e663195bf6f636dd4ffe';

  IconData? mainWeatherIconData;
  String mainWeather = '';

  Color selectedColorCelsius = const Color.fromARGB(255, 196, 192, 192); 
  Color selectedColorFar = const Color.fromARGB(255, 77, 76, 76); 

  Future<void> getCurrentWeather() async {
    final res =   await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apikey&units=metric'),
    );

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);
      setState(() {
        temperature = data['main']['temp'];
        humidityLevel = data['main']['humidity'];
        windSpeed = data['wind']['speed'];
        pressure = data['main']['pressure'];
        mainWeather = data['weather'][0]['main'];

    if (activeButtonFar) {
      temperature = temperature*(9/5) + 32;
    }
    
    if (mainWeather=='Clouds') {
      mainWeatherIconData = (Icons.cloud);
    }

    if (mainWeather=='Clear') {
      mainWeatherIconData = (Icons.sunny);
    }

    if (mainWeather=='Haze') {
      mainWeatherIconData = (Icons.waves);
    }

    if (mainWeather=='Smoke') {
      mainWeatherIconData = (WeatherIcons.smoke);
    }

    if (mainWeather=='Snow') {
      mainWeatherIconData = (WeatherIcons.snow);
    }

      });
    } 
  }

  void refresh() {
    getCurrentWeather();
  }

  void celsius() {
      activeButtonFar = false;
      activeButtonCelsius = true;
    setState(() {
      selectedColorFar = const Color.fromARGB(255, 77, 76, 76); 
      selectedColorCelsius = const Color.fromARGB(255, 196, 192, 192);
      if (unitTemperature == 'F'){
      temperature = (temperature-32)*(5/9);
      }
      unitTemperature = 'C';
    });

  }

  void farhenheit() {
      activeButtonCelsius = false;
      activeButtonFar = true;
    setState(() {
      selectedColorFar = const Color.fromARGB(255, 196, 192, 192);
      selectedColorCelsius = const Color.fromARGB(255, 77, 76, 76); 
      if (unitTemperature == 'C'){
      temperature = temperature*(9/5) + 32;
      }
      unitTemperature = 'F';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 3),
            child: IconButton(
              onPressed: refresh,
              icon: Icon(Icons.refresh),
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
        
            // BUTTONS ROW 
            Row(
              
              
              // DROP DOWN
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 0, right: 10, left: 10),
                  child: SizedBox(
                    width: 200,
                    child: DropdownButton<String>(
                      style: const TextStyle(fontSize: 20),
                      value: cityName,
                      onChanged: (String? newValue) {
                        setState(() {
                          cityName = newValue;});
                          getCurrentWeather();
                      },
                      items: cities
                          .map<DropdownMenuItem<String>>((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Container(
                            margin: EdgeInsets.only(left: 25),
                            child: Text(
                              item,
                              style: const TextStyle(
                              color: Color.fromARGB(255, 160, 162, 162)
                              )
                            )
                          ),
                        );
                      }).toList(),
                      dropdownColor: const Color.fromARGB(255, 59, 57, 57),
                      iconEnabledColor: const Color.fromARGB(255, 255, 255, 255),
                      iconSize: 20,
                    ),
                  ),
                ),
      
      
                  SizedBox(
                    width: 70,
                  ),
        
              // CELSIUS BUTTON 
                Container(
                  margin: EdgeInsets.all(0),
                  child: SizedBox(
                    height: 35,
                    width: 50,
                    child: TextButton(
                      onPressed: celsius,
                      style: TextButton.styleFrom(
                          padding: EdgeInsets.all(0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(0),
                                topLeft: Radius.circular(10),
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(0),
                              ),
                              side: BorderSide(color: selectedColorCelsius, width: 2.1)),
                          backgroundColor: const Color.fromARGB(255, 34, 33, 33)),
                      child: const Text("°C"),
                    ),
                  ),
                ),
        
        
              // FAHRENHEIT BUTTON
                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: SizedBox(
                    height: 35,
                    width: 50,
                    child: TextButton(
                      onPressed: farhenheit,
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                topLeft: Radius.circular(0),
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(10),
                              ),
                              side: BorderSide(color: selectedColorFar, width: 2.1)),
                          backgroundColor: const Color.fromARGB(255, 34, 33, 33)),
                      child: const Text("°F")
                    ),
                  ),
                ),
              ],
            ),
        
            SizedBox(height: 10),
        
            // MAIN CARD
            MainCard(temperature: temperature, unitTemperature: unitTemperature, mainWeather: mainWeather, mainWeatherIconData: mainWeatherIconData,),
        
            SizedBox(height: 25),
        
            Container
            ( alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(bottom: 8.0, left: 18),
              
              child: Text(
                'Weather Forecast',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500
        
                ),
              ),
            ),
        
      
            // FORECAST OVER DAYS
            WeatherForecast(temperature: temperature, unitTemperature: unitTemperature),
        
      
        
            SizedBox(height: 10),
        
      
          // Additional Information
            Container(
              alignment: Alignment.topLeft,
              padding: const EdgeInsets.only(left: 18, bottom: 8, right: 8, top: 3),
              child: Text(
                'Additional Information',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w500        
                ),
                ),
            ),
        
              AdditionalInfomation(humidityLevel: humidityLevel, windSpeed: windSpeed, pressure: pressure )
          ],
        ),
      ),
    );
  }
}
