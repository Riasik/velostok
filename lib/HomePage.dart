import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'Bike.dart';
import 'HomePageDetail.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Bike> listModel = [];
  var loading = false;

  Future<Null> getData() async {
    setState(() {
      loading = true;
    });

    final responseData = await http.get("http://18.133.7.134:88/getStockBikes");
    if (responseData.statusCode == 200) {
      final data = jsonDecode(responseData.body);
      print(data);
      setState(() {
        for (Map i in data) {
          listModel.add(Bike.fromJson(i));
        }
        loading = false;
      });
      log('message $data');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page List User'),
          centerTitle: true,
        ),
        body: Container(
            child: loading
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: listModel.length,
                    itemBuilder: (context, i) {
                      final nDataList = listModel[i];
                      return Container(
                          decoration: BoxDecoration(
                              border:  Border(
                                  bottom: BorderSide()),
                            borderRadius: BorderRadius.circular(10)),
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 100,
                           child: InkWell(

                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageDetail(

                    )));
                  },

                          child: Row(children: <Widget>[
                             Container(
                              child: nDataList.foto1 != ''
                                  ? Image(
                                      image: NetworkImage(nDataList.foto1))
                                  : null,
                              height: 100,
                              width: 100,
                            ),
                            Card(
                              margin: EdgeInsets.all(15),
                              child: Padding(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      nDataList.manufacturer,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.green),
                                    ),
                                    Text(nDataList.model),
                                    Text(nDataList.wheels.toString()),
                                    Text(nDataList.OLX),
                                    SizedBox(
                                      height: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          ]),
                      ));
                    })));
  }
}
