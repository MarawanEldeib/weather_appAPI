class Weather {
  final String cityName;
  final double temp;
  final double tempMin;
  final double tempMax;
  final double feelsLike;
  final double wind;
  final int humidity;
  final int pressure;
  final String weatherIcon;



  Weather({
    required this.cityName,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.feelsLike,
    required this.wind,
    required this.humidity,
    required this.pressure,
    required this.weatherIcon,

  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temp: json['main']['temp'].toDouble(),
      tempMin: json['main']['temp_min'].toDouble(),
      tempMax: json['main']['temp_max'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      wind: json['wind']['speed'].toDouble(),
      humidity: json['main']['humidity'],
      pressure: json['main']['pressure'],
      weatherIcon: json['weather'][0]['icon'],
    );
  }
}
