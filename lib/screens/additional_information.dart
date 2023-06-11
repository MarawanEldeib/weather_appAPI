import 'package:flutter/material.dart';

class additionalInformation extends StatelessWidget {
  final String wind;
  final String humidity;
  final String pressure;
  final String feelsLike;
  final String tempMin;
  final String tempMax;


  const additionalInformation({
    Key? key,
    required this.wind,
    required this.humidity,
    required this.pressure,
    required this.feelsLike,
    required this.tempMin,
    required this.tempMax,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle titleFont = const TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 18.0,
    );

    TextStyle infoFont = const TextStyle(
      fontWeight: FontWeight.w400,
      fontSize: 18.0,
    );

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 18.0),
                  Text("Temp_min", style: titleFont),
                  SizedBox(height: 18.0),
                  Text("Temp_max", style: titleFont),
                  SizedBox(height: 18.0),
                  Text("Feels Like", style: titleFont),
                  SizedBox(height: 18.0),
                  Text("Humidity", style: titleFont),
                  SizedBox(height: 18.0),
                  Text("Wind", style: titleFont),
                  SizedBox(height: 18.0),
                  Text("Pressure", style: titleFont),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text("$tempMin °C", style: infoFont),
                  SizedBox(height: 18.0),
                  Text("$tempMax °C", style: infoFont),
                  SizedBox(height: 18.0),
                  Text("$feelsLike °C", style: infoFont),
                  SizedBox(height: 18.0),
                  Text("$humidity %", style: infoFont),
                  SizedBox(height: 18.0),
                  Text("$wind km/h", style: infoFont),
                  SizedBox(height: 18.0),
                  Text("$pressure hPa", style: infoFont),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
