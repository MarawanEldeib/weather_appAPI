import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/model/weather_model.dart';

class WeatherService {
  static Future<Weather?> fetchCurrentWeather(String location) async {
    final url =
        "https://api.openweathermap.org/data/2.5/weather?q=$location&appid=02316c2cbd722b80c92c0c929ff88a5a&units=metric";
    final uri = Uri.parse(url);
    final response = await http.get(uri);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body) as Map<String, dynamic>;
      return Weather.fromJson(body);
    } else {
      return null;
    }
  }
}



