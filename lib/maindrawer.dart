import 'package:flutter/material.dart';
import 'package:flutterapp1/qrscanner.dart';
import './gallery.dart';
import './quizz.dart';
import './weather.dart';
class MainDrawer extends StatelessWidget
{
    @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
        child: ListView(
          children: <Widget>[
            new DrawerHeader(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.black, Colors.amberAccent])),
              child: Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                      'https://i.picsum.photos/id/996/200/300.jpg'),
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Quizz',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>Quizz()
                ));
              },
            ),
            Divider(
              thickness: 5,
            ),
            ListTile(
              title: Text(
                'Weather',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>WeatherApp()
                ));
              },
            ),
            Divider(
              thickness: 5,
              color: Colors.black,
            ),
            ListTile(
              title: Text(
                'Gallery',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>Gallery()
                ));
              },
            ),
            Divider(thickness: 5, color: Colors.black),
            ListTile(
              title: Text(
                'QrCode scanner',
                style: TextStyle(fontSize: 20),
              ),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>QRCode()
                ));
              },
            ),
            Divider(thickness: 5, color: Colors.black),
          ],
        ),
      );
  }
}