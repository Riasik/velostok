import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'Bike.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Membuat List Dari data Internet
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

  //Panggil Data / Call Data
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
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          height: 100,
                          // child: InkWell(

//                  onTap: (){
//                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePageDetail(
//                      dName: nDataList.manufacturer,
//                      dEmail: nDataList.model,
//                      dPhone: nDataList.wheels,
//                      dCity: nDataList.address.city,
//                      dZip: nDataList.address.zipcode,
//                    )));
//                  },

                          child: Column(children: <Widget>[
                            Container(
                              child: nDataList.foto1 != ''
                                  ? Image(
                                      //image: NetworkImage(nDataList.foto1)): " ",
                                      image: NetworkImage(nDataList.foto1))
                                  : " ",
                              height: 100,
                              width: 100,
                            ),
                            Card(
                              color: Colors.amber[100],
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
                          ]));
                    })));
  }
}
