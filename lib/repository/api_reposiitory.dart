import 'dart:convert';

import 'package:api_with_cubit/models/figma_model.dart';
import 'package:api_with_cubit/service/api_service.dart';

class ApiRepository {
  const ApiRepository({
    required this.apiService,
  });
  final ApiService apiService;

  Future<List<Result>?> getFigmaList() async {
    // if (response != null) {
    var json = jsonEncode([
      {
        "title": "Things to do",
        "subTitle": "Recommended for you",
        "body": [
          {
            "price": "None",
            "name": "Thai restaurant",
            "content": "@RoyalDbayeh",
            "location": "Dbayeh, Lebanon",
            "category": "Restaurant",
            "date": "None",
            "url": "assets/1.png",
            "time": "None",
            "event": "None",
            "likes": "3k",
            "new": "None"
          },
          {
            "price": "None",
            "name": "RNS Museum",
            "content": "None",
            "location": "Lansing, Illinois",
            "category": "Museum",
            "date": "None",
            "url": "assets/2.png",
            "time": "None",
            "event": "None",
            "likes": "3k",
            "new": "yes"
          }
        ]
      },
      {
        "title": "Businesses",
        "subTitle": "Featured",
        "body": [
          {
            "price": "None",
            "name": "Famous Lunch",
            "content": "None",
            "location": "Kent, Utah",
            "category": "None",
            "date": "None",
            "url": "assets/3.png",
            "time": "None",
            "event": "None",
            "likes": "3k",
            "new": "None"
          },
          {
            "price": "",
            "name": "The Rosebud",
            "content": "None",
            "location": "Portland, Illinois",
            "category": "None",
            "date": "None",
            "url": "assets/4.png",
            "time": "None",
            "event": "None",
            "likes": "3k",
            "new": "None"
          }
        ]
      },
      {
        "title": "Upcoming events",
        "subTitle": "Recommended for you",
        "body": [
          {
            "price": "Starting LBP 400,000",
            "name": "Stand up comedy with Jeff",
            "content": "None",
            "location": "Lansing, Illinois",
            "category": "Food Market Zone",
            "date": "5 April 2022",
            "url": "assets/5.png",
            "time": "4.30 pm",
            "event": "Comedy",
            "likes": "3k",
            "new": "None"
          },
          {
            "price": "Starting LBP 400,000",
            "name": "Event name",
            "content": "None",
            "location": "Portland, Illinois",
            "category": "Kisan Traders",
            "date": "5 April 2022",
            "url": "assets/6.png",
            "time": "7.30 pm",
            "event": "None",
            "likes": "3k",
            "new": "None"
          }
        ]
      },
      {
        "title": "Mini guides",
        "subTitle": "Loved by Users",
        "body": [
          {
            "price": "None",
            "name": "Saida",
            "content": "31 Listings",
            "location": "None",
            "category": "None",
            "date": "None",
            "url": "None",
            "time": "None",
            "event": "None",
            "likes": "None",
            "new": "None"
          },
          {
            "price": "None",
            "name": "Tripoli",
            "content": "31 Listings",
            "location": "None",
            "category": "None",
            "date": "None",
            "url": "None",
            "time": "None",
            "event": "None",
            "likes": "None",
            "new": "None"
          },
          {
            "price": "None",
            "name": "Hammana",
            "content": "31 Listings",
            "location": "None",
            "category": "None",
            "date": "None",
            "url": "None",
            "time": "None",
            "event": "None",
            "likes": "None",
            "new": "None"
          },
          {
            "price": "None",
            "name": "Beirut",
            "content": "31 Listings",
            "location": "None",
            "category": "None",
            "date": "None",
            "url": "None",
            "time": "None",
            "event": "None",
            "likes": "None",
            "new": "None"
          }
        ]
      }
    ]);
    final data = jsonDecode(json) as List<dynamic>;
    return data.map((e) => Result.fromJson(e)).toList();
  }
}
