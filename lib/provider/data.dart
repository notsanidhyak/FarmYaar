import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class Data with ChangeNotifier {
  var key = '09f9d13df80533d485cd54a484772167';
  var link = 'https://api.openweathermap.org/data/2.5/onecall';

  String _city = '';
  String _currTemp = '';
  late Position _position;
  dynamic _weatherData;
  List<Weather> _forecast = [];
  // Map<> _apiData = '';

  String get city => _city;
  String get currTemp => _currTemp;

  Position get position => _position;
  dynamic get weatherData => _weatherData;
  List<Weather> get forecast => _forecast;

  Future<void> getforecast() async {
    var wf = WeatherFactory(key);
    var lat = position.latitude;
    var lon = position.longitude;
    var temp = await wf.fiveDayForecastByLocation(lat, lon);
    _forecast = temp;
    print(temp[0].temperature);
    notifyListeners();
  }

  Future<void> getLocation() async {
    _position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.best,
    );
    List<Placemark> placemarks =
    await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark placemark = placemarks[0];
    _city = placemark.locality!;
    notifyListeners();
  }

  Future<void> getWeather() async {
    String par =
        '?lat=${position.latitude}&lon=${position.longitude}&appid=$key';
    var url = link + par;
    var response = await http.get(Uri.parse(url));
    _weatherData = jsonDecode(response.body);
    _currTemp = (_weatherData['current']['temp'] - 273.15).toStringAsFixed(0);
    getforecast();
    notifyListeners();
  }

  List<String> hourlyTime() {
    // List<String> time = [];
    // for (int i = 0; i < 24; i++) {
    //   time.add(DateFormat('hh:mm a').format(
    //       DateTime.fromMillisecondsSinceEpoch(weatherData['hourly'][i]['dt'])));
    // }
    List<String> time = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
    // return time;
    return time;
  }

  List<double> hourlyTemp() {
    List<double> temp = [];
    for (int i = 0; i < 24; i++) {
      temp.add(weatherData['hourly'][i]['temp'] - 273.15);
    }
    return temp;
  }

  List<double> hourlyHumidity() {
    List<double> humidity = [];
    for (int i = 0; i < 24; i++) {
      humidity.add(weatherData['hourly'][i]['humidity'].toDouble());
    }
    return humidity;
  }

  List<double> hourlyWindSpeed() {
    List<double> windSpeed = [];
    for (int i = 0; i < 24; i++) {
      windSpeed.add(weatherData['hourly'][i]['wind_speed'].toDouble());
    }
    return windSpeed;
  }

  List<double> hourlyPressure() {
    List<double> pressure = [];
    for (int i = 0; i < 24; i++) {
      pressure.add(weatherData['hourly'][i]['pressure'].toDouble());
    }
    return pressure;
  }

  List<double> hourlyClouds() {
    List<double> clouds = [];
    for (int i = 0; i < 24; i++) {
      clouds.add(weatherData['hourly'][i]['clouds'].toDouble());
    }
    return clouds;
  }

  List<double> hourlyDewPoint() {
    List<double> dewPoint = [];
    for (int i = 0; i < 24; i++) {
      dewPoint.add(weatherData['hourly'][i]['dew_point'].toDouble());
    }
    return dewPoint;
  }

  List<double> hourlyUvi() {
    List<double> uvi = [];
    for (int i = 0; i < 24; i++) {
      uvi.add(weatherData['hourly'][i]['uvi'].toDouble());
    }
    return uvi;
  }

  List<double> hourlyPop() {
    List<double> pop = [];
    for (int i = 0; i < 24; i++) {
      pop.add(weatherData['hourly'][i]['pop'].toDouble());
    }
    return pop;
  }

  List<String> dailyTime() {
    List<String> time = ['Sat', 'Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri'];
    return time;
  }

  List<double> dailyTemp() {
    List<double> temp = [];
    for (int i = 0; i < 7; i++) {
      temp.add(forecast[i].temperature!.celsius!);
    }
    return temp;
  }

  List<double> dailyHumidity() {
    List<double> humidity = [];
    for (int i = 0; i < 7; i++) {
      humidity.add(weatherData['daily'][i]['humidity'].toDouble());
    }
    return humidity;
  }

  List<double> dailyWindSpeed() {
    List<double> windSpeed = [];
    for (int i = 0; i < 7; i++) {
      windSpeed.add(weatherData['daily'][i]['wind_speed'].toDouble());
    }
    return windSpeed;
  }

  List<double> dailyWindDeg() {
    List<double> windDeg = [];
    for (int i = 0; i < 7; i++) {
      windDeg.add(weatherData['daily'][i]['wind_deg'].toDouble());
    }
    return windDeg;
  }

  List<double> dailyPressure() {
    List<double> pressure = [];
    for (int i = 0; i < 7; i++) {
      pressure.add(weatherData['daily'][i]['pressure'].toDouble());
    }
    return pressure;
  }

  List<double> dailyClouds() {
    List<double> clouds = [];
    for (int i = 0; i < 7; i++) {
      clouds.add(weatherData['daily'][i]['clouds'].toDouble());
    }
    return clouds;
  }

  List<double> dailyDewPoint() {
    List<double> dewPoint = [];
    for (int i = 0; i < 7; i++) {
      dewPoint.add(weatherData['daily'][i]['dew_point'].toDouble());
    }
    return dewPoint;
  }

  List<double> dailyUvi() {
    List<double> uvi = [];
    for (int i = 0; i < 7; i++) {
      uvi.add(weatherData['daily'][i]['uvi'].toDouble());
    }
    return uvi;
  }

  List<double> dailyPop() {
    List<double> pop = [];
    for (int i = 0; i < 7; i++) {
      pop.add(weatherData['daily'][i]['pop'].toDouble());
    }
    return pop;
  }
}
