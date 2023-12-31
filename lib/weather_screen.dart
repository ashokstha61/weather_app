import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/additional_information.dart';
import 'package:weather_app/hourly_forcast_item.dart';
import 'package:weather_app/secret.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  double temp = 0;
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future getCurrentWeather() async {
    try {
      String cityName = 'London';

      final res = await http.get(
        Uri.parse(
            'https://api.openweathermap.org/data/2.5/weather?q=$cityName,uk&APPID=$openApiKey'),
      );
      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw 'error occured';
      }
      setState(() {
        temp = data['list'][0]['main']['temp'];
      });
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //main card
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 10,
                      sigmaY: 10,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            '$temp k ',
                            style: TextStyle(
                                fontSize: 32, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Icon(
                            Icons.cloud,
                            size: 64,
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'Rain',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Weather Forcast',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HourlyForcastItem(
                    time: '3:00',
                    temperature: '10℃',
                    icon: Icons.cloud,
                  ),
                  HourlyForcastItem(
                    time: '4:00',
                    temperature: '15℃',
                    icon: Icons.cloud,
                  ),
                  HourlyForcastItem(
                    time: '5:00',
                    temperature: '15℃',
                    icon: Icons.cloud,
                  ),
                  HourlyForcastItem(
                    time: '6:00',
                    temperature: '20℃',
                    icon: Icons.sunny_snowing,
                  ),
                  HourlyForcastItem(
                    time: '7:00',
                    temperature: '16℃',
                    icon: Icons.water_drop_outlined,
                  ),
                  HourlyForcastItem(
                    time: '8:00',
                    temperature: '19℃',
                    icon: Icons.cloud,
                  ),
                  HourlyForcastItem(
                    time: '9:00',
                    temperature: '25℃',
                    icon: Icons.sunny,
                  ),
                  HourlyForcastItem(
                    time: '10:00',
                    temperature: '32℃',
                    icon: Icons.sunny,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Additional Infrmation',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AdditionalInformation(
                  icon: Icons.water_drop,
                  label: 'Humidity',
                  value: '91',
                ),
                AdditionalInformation(
                  icon: Icons.air,
                  label: 'Wind Speed',
                  value: '7.5',
                ),
                AdditionalInformation(
                  icon: Icons.beach_access,
                  label: 'Pressure',
                  value: '1007',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
