import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class WorldTime {

   String location;
   late String time;
   String flag;
   String url;


  WorldTime({required this.location, required this.flag, required this.url});

  Future<void> getTime() async {
    try{
      Response response = await get(
          "http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);
      // print(data);

      // get properties by data

      String dateTime = data['datetime'];
      String offSet = data['utc_offset'].substring(1, 3);

      // create date time object

      DateTime now = DateTime.parse(dateTime);
      now = now.add(Duration(hours: int.parse(offSet)));

      time = now.toString();
    }catch(e) {
      print('$e');
      time = 'could not get time data';
    }
  }
}