import 'dart:async';
import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LocalClockLogic extends GetxController {

  String weatherDescription = 'Loading...';
  double temperature = 0.0;
  String weatherIcon = '';
  String weatherCondition = '';

  int type = 0;

  final String _apiKey = '0b5172c5362848a8a2932847242911';
  String city = 'London';

  Timer? _timer;

  var monthDayStr = '-'.obs;
  var weekDayStr = '-'.obs;
  var apmStr = '-'.obs;

  void startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 60), (timer) {
        getData();
    });
  }

  void getData() async {
    await getCityByIP();

    final String url =
        'http://api.weatherapi.com/v1/current.json?key=$_apiKey&q=$city&aqi=no';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      weatherDescription = data['current']['condition']['text'];
      temperature = data['current']['temp_c'];
      weatherCondition = weatherDescription;
      weatherIcon = data['current']['condition']['icon'];
    } else {
      weatherDescription = 'Failed to load weather data';
    }

    DateTime now = DateTime.now();
    monthDayStr.value = '${now.month}/${now.day}';
    weekDayStr.value = getWeekDay(now.weekday);
    apmStr.value = (now.hour < 12) ? 'AM' : 'PM';


    update();
  }

  String getWeekDay(int weekday) {
    switch (weekday) {
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      default:
        return '';
    }
  }

  Future<void> getCityByIP() async {
    try {
      final response = await http.get(Uri.parse('https://ipinfo.io/json?token=b3421373bb9b4f'));
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        city = data['city'] ?? 'Unknown City';
      } else {
        city = 'Error fetching city';
      }
    } catch (e) {
      city = 'Error fetching city';
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
