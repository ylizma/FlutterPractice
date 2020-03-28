import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class WeatherData extends StatefulWidget {
  String city = '';

  WeatherData(this.city);

  @override
  _WeatherDataAppState createState() => _WeatherDataAppState();
}

class _WeatherDataAppState extends State<WeatherData> {
  var data;

  @override
  void initState() {
    super.initState();
    getData(widget.city);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("${widget.city}"),
          backgroundColor: Colors.deepOrange,
        ),
        body: (data == null)
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: (data == null) ? 0 : data['list'].length,
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.deepOrange,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage(
                                  "imgs/${data['list'][index]['weather'][0]['main'].toString().toLowerCase()}.png"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "${new DateFormat('E-dd/MM/yyyy').format(DateTime.fromMicrosecondsSinceEpoch(data['list'][index]['dt'] * 1000000))}",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    "${new DateFormat('HH:mm').format(DateTime.fromMicrosecondsSinceEpoch(data['list'][index]['dt'] * 1000000))} | ${data['list'][index]['main']['temp'].round()} C",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        Text("${data['list'][index]['main']['temp'].round()} C",
                            style: TextStyle(
                              color: Colors.white,
                            ))
                      ],
                    ),
                  );
                },
              ));
  }

  void getData(String city) {
    String url = "https://samples.openweathermap.org/data/2.5/forecast?q=" +
        city +
        "&appid=b6907d289e10d714a6e88b30761fae22";
    http.get(url).then((res) {
      setState(() {
        this.data = jsonDecode(res.body);
        print(this.data);
      });
    }).catchError((error) => error.toString());
  }
}
