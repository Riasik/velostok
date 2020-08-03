import 'dart:convert';
import 'dart:math';

import 'dart:math';
List<Bike> modelUserFromJson(String str) => List<Bike>.from(json.decode(str).map((x) => Bike.fromJson(x)));
String modelUserToJson(List<Bike> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Bike {
  int id;
  var wheels;
  var size;
  String manufacturer;
  String model;
  String color;
  int quantity;
  var date_come;
  var price;
  String date_sold;
  String sold_price;
  String who_sold;
  String other;
  String foto1;
  String foto2;
  String foto3;
  String foto4;
  String OLX;

  Bike({ this.id, this.wheels, this.size,this.manufacturer,this.model, this.color,
    this.quantity, this.date_come, this.price, this.date_sold, this.sold_price,
    this.who_sold, this.other, this.foto1, this.foto2, this.foto3, this.foto4, this.OLX});

  factory Bike.fromJson(Map<String, dynamic> json) => Bike(
    id: json["id"],
    wheels:json["wheels"],
    size:json["size"],
    manufacturer:json["manufacturer"],
    model:json["model"],
    color:json["color"],
    quantity:json["Q"],
    date_come:json["date_come"],
    price:json["price"],
    date_sold:json["date_sold"],
    sold_price:json["sold price"],
    who_sold:json["who_sold"],
    other:json["other"],
    foto1:json["foto1"],
    foto2:json["foto2"],
    foto3:json["foto3"],
    foto4:json["foto4"],
      OLX:json["OLX"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "wheels": wheels,
    "size": size,
    "manufacturer": manufacturer,
    "model": model,
    "color": color,
    "Q": quantity,
    "date_come":date_come,
    "price":price,
    "date_sold":date_sold,
    "sold price":sold_price,
    "who_sold":who_sold,
    "other":other,
    "foto1":foto1,
    "foto2":foto2,
    "foto3":foto3,
    "foto4":foto4,
    "OLX":OLX
  };


}

