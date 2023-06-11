import 'package:flutter/material.dart';

class currentWeather extends StatelessWidget {
  const currentWeather(
      {Key? key,
      required this.temp,
      required this.location,
      required this.iconData})
      : super(key: key);

  final IconData iconData;
  final String temp;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, size: 100),
          const SizedBox(
            height: 40.0,
          ),
          Text("$temp", style: const TextStyle(fontSize: 46.0,),),
          const SizedBox(
            height: 20.0,
          ),
          Text("$location", style: const TextStyle(fontSize: 18.0, color: Colors.grey,),
          ),
        ],
      ),
    );
  }
}


