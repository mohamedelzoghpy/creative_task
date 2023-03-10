// ignore_for_file: must_be_immutable, avoid_print

import 'package:creativa_flutter/weather_result.dart';
import 'package:flutter/material.dart';
class WeatherSearch extends StatefulWidget {
  WeatherSearch({super.key,this.cityName});
var cityName;
  @override
  State<WeatherSearch> createState() => _WeatherSearchState(cityName);
}

class _WeatherSearchState extends State<WeatherSearch> {
  var cityName;

  var textFormController = TextEditingController();

  var formkey=GlobalKey<FormState>();

  _WeatherSearchState(this.cityName);

  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Container(
          color: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Form(
              key: formkey,
              child: Column(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 2,),
                  const CircleAvatar(
                    radius: 100,
                      backgroundImage:AssetImage('assets/images/icon.jpg')),

                      //child: Image.asset('assets/images/icon.jpg')),
                  const Spacer(),
                  TextFormField(
                    controller:textFormController ,
                    validator: (value) {
                            if (value!.isEmpty) {
                    return "Input must not be Empty";
                   }
                            return null;},
                    decoration: const InputDecoration(
                      labelText: 'Enter City',
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.search,),
                    ),
                  ),
                  TextButton(
                    onPressed: ()async{
                      cityName=textFormController.text;
                try{
                  setState(()   {
                    if (formkey.currentState!.validate()) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context){
                            return WeatherResult(cityName: cityName);
                          },
                        ),
                      );
                    }
                  });
                } catch(error){
                  print(error.toString()) ;
                }

                    },
                    child: const Text(

                      'Submit',
                  style: TextStyle(fontSize: 16,
                    color: Colors.black,
                  ),
                  ),
                  ),
                  const Spacer(),
                  const Text(
                    'Search For The City You Need To Its Weather',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                  const Spacer(flex: 3,),

                ],
              ),
            ),
          ),
        ),
      ),

    );

  }
}
