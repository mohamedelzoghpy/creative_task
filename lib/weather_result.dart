// ignore_for_file: prefer_typing_uninitialized_variables, must_be_immutable, prefer_const_literals_to_create_immutables, avoid_print

import 'dart:convert';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
class WeatherResult extends StatefulWidget {
  String ?cityName;

  WeatherResult({super.key,  this.cityName});

  @override
  // ignore: no_logic_in_create_state
  State<WeatherResult> createState() {return  _WeatherResultState(cityName);}

}

class _WeatherResultState extends State<WeatherResult> {
  var date;
  var temp;
  var maxTemp;
  var minTemp;
  var weatherState;
  var photo;
  String? cityName;
  var photo1;
  var photo2='assets/images/clear.jpg';
  var photo3='assets/images/cloud.jpg';
  var dataReponse;


  _WeatherResultState(this.cityName);

  @override
    initState()  {
    super.initState();
    getData(cityName!);
  }

  @override
  Widget build(BuildContext context)
  {
    if(temp>=16){
      photo1=photo2;
    }else{
      photo1=photo3;
    }

    return  Scaffold(
      appBar: AppBar(
        title: const Text('Weather Search Result'),
      ),

      body:ConditionalBuilder(condition:dataReponse!=200 ,
      builder:(context) =>  Stack(
        children: [

          Image.asset(photo1,

            fit: BoxFit.cover,
            height: double.infinity,
          ),

          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 2,),
              Text(
                '${cityName}',
                style: const TextStyle(fontSize: 40,
                  fontWeight: FontWeight.bold,),
              ),
              Text('Update:${date}',
                style: const TextStyle(fontSize: 16,
                ),),
              const Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network('http:$photo'),
                  Text(
                    '${temp}',
                    style: const TextStyle(fontSize: 40,
                      fontWeight: FontWeight.bold,),
                  ),
                  Column(
                    children: [
                      Text(
                        'maxTemp:${maxTemp}',
                        style: const TextStyle(fontSize: 16,
                        ),
                      ),
                      Text(
                        'minTemp:${minTemp}',
                        style: const TextStyle(fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Text(
                '${weatherState}',
                style: const TextStyle(fontSize: 40,
                  fontWeight: FontWeight.bold,),
              ),
              const Spacer(flex: 6),

            ],
          ),

        ],
      ),
      fallback:(context) => const Center(child: CircularProgressIndicator()) ,),
    );
  }

 Future<dynamic> getData(String cityName )async {
    var response = await http.get(
        Uri.parse(
            'https://api.weatherapi.com/v1/forecast.json?key=f878de78308946b9940142527230503&q=${cityName}'));
    Map <String,dynamic> data = jsonDecode(response.body);
    var reponse= response.statusCode;
    print(reponse);
    var jsonData = data['forecast']['forecastday'][0]['day'];
    setState(() {
      date=  data['current']['last_updated'];
      temp= data['current']['temp_c'];
      maxTemp= jsonData['maxtemp_c'];
      minTemp= jsonData['mintemp_c'];
      weatherState= jsonData['condition']['text'];
      photo= jsonData['condition']['icon'];
    });

    dataReponse=response;
    return data;


  }


}


