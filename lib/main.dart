import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app_v6/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app_v6/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app_v6/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
      return Colors.orange; // MaterialColor
    case 'Partly cloudy':
      return Colors.yellow; // MaterialColor
    case 'Cloudy':
      return Colors.grey; // MaterialColor
    case 'Overcast':
      return Colors.blueGrey; // MaterialColor
    case 'Mist':
      return Colors.lightBlue; // MaterialColor
    case 'Patchy rain possible':
      return Colors.green; // MaterialColor
    case 'Light rain':
      return Colors.blue; // MaterialColor
    case 'Moderate rain':
      return Colors.deepOrange; // MaterialColor
    case 'Heavy rain':
      return Colors.red; // MaterialColor
    case 'Thundery outbreaks possible':
      return Colors.purple; // MaterialColor
    case 'Light snow':
      return Colors.blue[100] as MaterialColor; // Light shade
    case 'Heavy snow':
      return Colors.blue[200] as MaterialColor; // Light shade
    case 'Blizzard':
      return Colors.blue[800] as MaterialColor; // Darker shade
    case 'Fog':
      return Colors.teal; // MaterialColor
    case 'Freezing fog':
      return Colors.cyan; // MaterialColor
    case 'Patchy light drizzle':
      return Colors.lightGreen; // MaterialColor
    case 'Light drizzle':
      return Colors.lightBlueAccent as MaterialColor; // MaterialColor
    case 'Heavy freezing drizzle':
      return Colors.blueGrey[600] as MaterialColor; // Shade
    case 'Patchy light rain':
      return Colors.amber; // MaterialColor
    case 'Patchy snow possible':
      return Colors.blue[300] as MaterialColor; // Light shade
    case 'Moderate snow':
      return Colors.blue[400] as MaterialColor; // Moderate shade
    case 'Patchy heavy snow':
      return Colors.indigo; // MaterialColor
    case 'Ice pellets':
      return Colors.brown; // MaterialColor
    case 'Light rain shower':
      return Colors.lime; // MaterialColor
    case 'Moderate or heavy rain shower':
      return Colors.redAccent as MaterialColor; // MaterialColor
    case 'Torrential rain shower':
      return Colors.pink; // MaterialColor
    case 'Light sleet':
      return Colors.grey[400] as MaterialColor; // Shade
    case 'Moderate or heavy sleet':
      return Colors.grey[600] as MaterialColor; // Shade
    case 'Patchy light rain with thunder':
      return Colors.deepPurpleAccent as MaterialColor; // MaterialColor
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple; // MaterialColor
    case 'Patchy light snow with thunder':
      return Colors.lightBlue[50] as MaterialColor; // Very light shade
    case 'Moderate or heavy snow with thunder':
      return Colors.blue[50] as MaterialColor; // Very light shade
    default:
      return Colors.blue; // Fallback color
  }
}
