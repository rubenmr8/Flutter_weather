import 'dart:convert';
//import 'dart:js';

import 'package:http/http.dart' as http;
import 'package:semipruebatiempo/models.dart';

class DataService {
  Future<WeatherResponse> getWeather(String city) async{

    //https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={API key}
    final queryParameters = {
      'q': city,
      'appid': '78ab3e07289d77616f43cb4bb31f669c',
      'units': 'metric'
    };
    final uri = Uri.https(
        'api.openweathermap.org', '/data/2.5/weather', queryParameters);

    final response = await http.get(uri);

    print(response.body);

    final json = jsonDecode(response.body);
    return WeatherResponse.fromJson(json);

  }
}