import 'package:flutter/material.dart';
import './gallerydata.dart';

class Gallery extends StatefulWidget {
  @override
  _GalleryState createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  String keyword = "";



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(keyword),
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: TextField(
              style: TextStyle(fontSize: 22),
              onChanged: (value) {
                setState(() {
                  this.keyword = value;
                });
              },
            ),
            padding: EdgeInsets.all(10),
          ),
          Container(
              width: double.infinity,
              child: RaisedButton(
                padding: EdgeInsets.all(10),
                color: Colors.deepOrange,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => GalleryDataPage(keyword)));
                },
                child: Text(
                  "Get images",
                  style: TextStyle(color: Colors.white),
                ),
              ))
        ],
      ),
    );
  }
}
