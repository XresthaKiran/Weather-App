class Current {
  final double temp;
  final double wind;
  final double humidity;
  final WeatherCondition condition;

  Current(
      {required this.humidity,
        required this.wind,
      required this.temp,
      required this.condition});
}

class WeatherCondition {
  final String text;
  final String icon;
  
  WeatherCondition({ required this.text, required this.icon});
}
