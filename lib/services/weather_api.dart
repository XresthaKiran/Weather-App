import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:weather_app/model/location.dart';
import 'package:weather_app/model/temp_condition.dart';
import 'package:weather_app/model/weather.dart';

class WeatherApi {
  static Future<Weather> getData(String cityName) async {
    const url =
        'http://api.weatherapi.com/v1/current.json?key=c6b5e4b6203642b099171105231407&q=';
    final uri = Uri.parse(url + cityName);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final location = Location(
      name: json['location']['name'],
      country: json['location']['country'],
      lat: json['location']['lat'],
      lon: json['location']['lon'],
    );
    final condition = WeatherCondition(
      
      text: json['current']['condition']['text'],
      icon: json['current']['condition']['icon'],
    );
    final current = Current(
      humidity: json['current']['humidity'],
      wind: json['current']['wind_kph'],
      temp: json['current']['temp_c'],
      condition: condition,
    );
    return Weather(location: location, current: current);
  }
}
