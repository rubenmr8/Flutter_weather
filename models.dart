/*
{
  "weather": [
    {
      "description": "clear sky",
      "icon": "01d"
    }
  ],
  "main": {
    "temp": 282.55,
  },

  "name": "Mountain View",
}
 */

import 'package:flutter/material.dart';

class WeatherInfo{
  final String description;
  final String icon;
  int id;

  WeatherInfo({required this.description,required this.id, required this.icon});


  factory WeatherInfo.fromJson(Map<String, dynamic> json){
    var description = json['description'];
    final icon = json['icon'];
    var id = json['id'];

    if(id >=200 && id <=232){
      description = 'Tormenta';

    }else if(id >=300 && id <=321){
      description = 'Llovizna';

    }else if(id >=500 && id <=504){
      description = 'Lluvia';

    }else if(id == 511){
      description = 'Lluvia y nieve';

    }else if(id >=520 && id <=531){
      description = 'Lluvia intensa';

    }else if(id >=600 && id <=622){
      description = 'Nieve';

    }else if(id >=701 && id <=781){
      description = 'Neblina';

    }else if(id == 800){
      description = 'Despejado';

    }else if(id >=801 && id <=804) {
      description = 'Nublado';
    }else{
      description = '';
    }

    return WeatherInfo(description: description,id: id, icon: icon);

  }
}


class TemperatureInfo{
  final double temperature;

  TemperatureInfo({required this.temperature});
  factory TemperatureInfo.fromJson(Map<String, dynamic> json){
    final temperature = json['temp'];
    return TemperatureInfo(temperature: temperature);
  }
}

class WeatherResponse{
  final String cityName;
  final TemperatureInfo tempInfo;
  final WeatherInfo weatherInfo;

  String get iconUrl{
    return 'https://openweathermap.org/img/wn/${weatherInfo.icon}@2x.png';
  }

  WeatherResponse({required this.cityName, required this.tempInfo, required this.weatherInfo});
  factory WeatherResponse.fromJson(Map<String, dynamic> json){
    final cityName = json['name'];

    final tempInfoJson = json["main"];
    final tempInfo = TemperatureInfo.fromJson(tempInfoJson);

    final weatherInfoJson = json['weather'][0];
    final weatherInfo = WeatherInfo.fromJson(weatherInfoJson);


    return WeatherResponse(cityName: cityName,tempInfo: tempInfo, weatherInfo: weatherInfo);
  }
}