class Current {
  final double temp;
  final WeatherCondition condition;

 Current({required this.temp, required this.condition});
}

class WeatherCondition {
  final String text;
  final String icon;
  WeatherCondition({required this.text, required this.icon});
}
