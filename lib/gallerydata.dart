import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class GalleryDataPage extends StatefulWidget {
  String keyword = "";

  GalleryDataPage(this.keyword);

  @override
  _GalleryDataPageState createState() => _GalleryDataPageState();
}

class _GalleryDataPageState extends State<GalleryDataPage> {
  var size = 10;
  var currentPage = 1;
  List<dynamic> hits=[];
  var data;
  int totalPages;
  ScrollController _scrollController=new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    this._scrollController.addListener((){
      if(_scrollController.position.pixels==_scrollController.position.maxScrollExtent){
        if(currentPage<totalPages){
          ++currentPage;
          getData();
        }
      }
    });
  }

  getData() {
    String url =
        "https://pixabay.com/api/?key=15780671-776c2012beb95faa023dc538b&q=${widget
        .keyword}&page=${currentPage = 1}&per_page=${size = 5}";
    http.get(url).then((res) {
      setState(() {
        data = jsonDecode(res.body);
        hits.addAll(data['hits']);
        if(data['totalHits']%size==0) totalPages=(data['totalHits']~/size);
        else totalPages=((data['totalHits']/size)+1).floor();
      });
    }).catchError((err) => {print(err)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrange,
          title: Text("${widget.keyword} | page ${currentPage}/${totalPages}"),
        ),
        body: (data == null)
            ? CircularProgressIndicator()
            : ListView.builder(
          itemCount: (data == null ? 0 : hits.length),
          controller: _scrollController,
          itemBuilder: (context, index) {
            return Column(
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.only(right: 10,left: 10),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(
                          hits[index]['tags'],
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    color: Colors.orangeAccent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Card(
                      child:Image.network(hits[index]['webformatURL'],fit: BoxFit.fitWidth,),
                    ),
                    padding: EdgeInsets.only(left: 10,right: 10),
                  ),
                )
              ],
            );
          },
        ));
  }
}
