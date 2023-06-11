import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/screens/additional_information.dart';
import 'package:weather_app/screens/current_weather.dart';
import 'package:weather_app/screens/weatherIcon.dart';
import 'package:weather_app/services/weather_api_client.dart';

import '../model/weather_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Weather? data;
  late String city;
  final TextEditingController cityController = TextEditingController();

  Future<void> getData(BuildContext context) async {
    try {
      data = await WeatherService.fetchCurrentWeather(city);
      if (data == null) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Error'),
              content: const Text('Could not fetch weather data. '
                  'Please check the city name and try again.'),
              actions: <Widget>[
                TextButton(
                  child: const Text('OK'),
                  onPressed: () {Navigator.of(context).pop();},
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void searchCityWeather(String city) {
    setState(() {
      this.city = city;
    });
    getData(context);
  }

  @override
  void initState() {
    super.initState();
    city = 'Cairo';
    getData(context);
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white, elevation: 0.0,
        title: TextField(
          controller: cityController,
          decoration: const InputDecoration(hintText: 'Enter a city name ex: london',),
          onSubmitted: searchCityWeather,
        ),
        actions: [
          IconButton(
            onPressed: () {searchCityWeather(cityController.text);},
            icon: const Icon(Icons.search), color: Colors.black,
          ),
        ],
      ),
      body: FutureBuilder(
        future: getData(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: SpinKitFadingCircle(color: Colors.white, size: 50.0,
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (data != null)
                    currentWeather(
                      temp: "${data!.temp.toStringAsFixed(1)}°C",
                      location: data!.cityName,
                      iconData: getWeatherIconData(data!.weatherIcon),
                    )
                  else
                    const Center(
                      child: Text('\n nothing to show'),
                    ),
                  const SizedBox(
                    height: 60.0,
                  ),
                  const Text("Additional Information",
                    style: TextStyle(fontSize: 24.0, color: Colors.blueGrey, fontWeight: FontWeight.bold,),
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20.0,
                  ),
                  if (data != null)
                    additionalInformation(
                      wind: "${data!.wind}",
                      humidity: "${data!.humidity}",
                      pressure: "${data!.pressure}",
                      feelsLike: "${data!.feelsLike}",
                      tempMin: "${data!.tempMin}",
                      tempMax: "${data!.tempMax}",
                    )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
