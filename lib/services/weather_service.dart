import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app_v6/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl =
      'http://api.weatherapi.com/v1'; //de el agza2 el thabta fel request mbtt8yr4
  final String apiKey = '5da34f5b61ff4e0f95a04751242308';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Oops, There was an error. Try Later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops, There was an error. Try Later');
    }
  }

  // Future<WeatherModel?> getCurrentWeather({required String cityName}) async {
  //   Response response =
  //       await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');
  //   if (response.statusCode == 200) {
  //     WeatherModel weatherModel = WeatherModel.fromJson(response.data);
  //   } else {
  //     final String errorMessage = response.data['error']['message'];
  //     throw Exception(errorMessage);
  //   }
  // }
}
