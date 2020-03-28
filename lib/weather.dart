import 'package:flutter/material.dart';
import './WeatherData.dart';

class WeatherApp extends StatefulWidget {
  @override
  _WeatherAppState createState() => _WeatherAppState();
}

class _WeatherAppState extends State<WeatherApp> {
  String city = "";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text('weatherApp'),
      ),
      body: Column(
        children: <Widget>[
        TextField(
              decoration: InputDecoration(hintText: 'tapez une ville '),
              onChanged: (value) {
                setState(() {
                  this.city = value;
                });
              },
          onSubmitted: (value){
                setState(() {
                  this.city=value;
                });
          },
            ),

          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: RaisedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder:(context)=>WeatherData(city)));
                },
                textColor: Colors.white,
                color: Colors.deepOrange,
                child: Text("Get Info"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
