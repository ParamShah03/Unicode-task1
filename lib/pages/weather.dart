import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:convert';

import '../main.dart';


class Weather extends StatefulWidget {
  final String place;
  const Weather({required this.place ,Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  dynamic temperature;
  dynamic description;
  dynamic humidity;
  dynamic windspeed;
  dynamic currently;


  Future getWeather() async {
    http.Response response = await http.get(Uri.parse(
        'https://api.openweathermap.org/data/2.5/weather?q=${widget.place}&appid=fa0026ddc8d152df5e6487aa1103c029&units=metric'));
    var results = jsonDecode(response.body);
    setState(() {
      temperature = results['main']['temp'].toString();
      description = results['weather'][0]['description'].toString();
      humidity = results['main']['humidity'].toString();
      currently = results['weather'][0]['main'].toString();
      windspeed = results['wind']['speed'].toString();
    });
  }

  @override
  void initState() {
    super.initState();
    getWeather();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: const Text('Weather',
          style: TextStyle(
              fontSize: 25.0
          ),
        ),
        centerTitle: true,
        titleSpacing: 2.0,
        backgroundColor: Colors.indigo[700],
        toolbarHeight: 55.0,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(50.0),
            color: Colors.red,
            child: Column(
              children: [
                Text('Currently in ${widget.place}',
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(height: 5.0),
                Text((temperature!= null)? temperature + "\u00B0C" : "Loading",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w500
                  ),
                ),
                const SizedBox(height: 5.0),
                Text(description?? "Loading",
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25.0,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w500
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(

                children:  [
                  ListTile(
                    tileColor: Colors.blueGrey[200],
                    leading: const FaIcon(FontAwesomeIcons.temperatureHalf),
                    title: const Text('Temperature',
                      style: TextStyle(fontSize: 20.0,letterSpacing: 2.0,fontWeight: FontWeight.bold ),),
                    trailing: Text((temperature!= null)? temperature + "\u00B0C" : "Loading",
                      style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600),),
                  ),
                  const SizedBox(height: 10.0),
                  ListTile(
                    tileColor: Colors.blueGrey[200],
                    leading: const FaIcon(FontAwesomeIcons.cloud),
                    title: const Text('Weather',
                      style: TextStyle(fontSize: 20.0,letterSpacing: 2.0,fontWeight: FontWeight.bold ),),
                    trailing: Text(currently??"Loading",
                      style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600),),
                  ),
                  const SizedBox(height: 10.0),
                  ListTile(
                    tileColor: Colors.blueGrey[200],
                    leading: const FaIcon(FontAwesomeIcons.sun),
                    title: const Text('Humidity',
                      style: TextStyle(fontSize: 20.0,letterSpacing: 2.0,fontWeight: FontWeight.bold ),),
                    trailing: Text(humidity??"Loading",
                      style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600),),
                  ),
                  const SizedBox(height: 10.0),
                  ListTile(
                    tileColor: Colors.blueGrey[200],
                    leading: const FaIcon(FontAwesomeIcons.wind),
                    title: const Text('Wind-Speed',
                      style: TextStyle(fontSize: 20.0,letterSpacing: 2.0,fontWeight: FontWeight.bold ),),
                    trailing: Text(windspeed??"Loading",
                      style: const TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600),),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context)=>const Home()));
        },
        backgroundColor: Colors.indigo[700],
        child: const Icon(
            Icons.home
        ),
      ),
    );
  }
}