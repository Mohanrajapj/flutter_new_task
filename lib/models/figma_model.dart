// To parse this JSON data, do
//
//     final result = resultFromJson(jsonString);

import 'dart:convert';

List<Result> resultFromJson(String str) =>
    List<Result>.from(json.decode(str).map((x) => Result.fromJson(x)));

String resultToJson(List<Result> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Result {
  Result({
    required this.title,
    required this.subTitle,
    required this.body,
  });

  String title;
  String subTitle;
  List<Body> body;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        title: json["title"],
        subTitle: json["subTitle"],
        body: List<Body>.from(json["body"].map((x) => Body.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "subTitle": subTitle,
        "body": List<dynamic>.from(body.map((x) => x.toJson())),
      };
}

class Body {
  Body({
    required this.price,
    required this.name,
    required this.content,
    required this.location,
    required this.category,
    required this.date,
    required this.url,
    required this.time,
    required this.event,
    required this.likes,
    required this.bodyNew,
  });

  String price;
  String name;
  String content;
  String location;
  String category;
  String date;
  String url;
  String time;
  String event;
  String likes;
  String bodyNew;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        price: json["price"],
        name: json["name"],
        content: json["content"],
        location: json["location"],
        category: json["category"],
        date: json["date"],
        url: json["url"],
        time: json["time"],
        event: json["event"],
        likes: json["likes"],
        bodyNew: json["new"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "name": name,
        "content": content,
        "location": location,
        "category": category,
        "date": date,
        "url": url,
        "time": time,
        "event": event,
        "likes": likes,
        "new": bodyNew,
      };
}
