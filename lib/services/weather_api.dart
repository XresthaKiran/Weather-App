import 'package:http/http.dart'as http;
import 'dart:convert';
import 'package:weather_app/model/location.dart';
import 'package:weather_app/model/temp_condition.dart';
import 'package:weather_app/model/weather.dart';

class WeatherApi{
    static Future<Weather> getData() async {
  const url = 'http://api.weatherapi.com/v1/current.json?key=1bc0383d81444b58b1432929200711&q=London';
  final uri = Uri.parse(url);
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
    temp: json['current']['temp_c'],
    condition: condition,
  );
  return Weather(location: location, current: current);
}
}