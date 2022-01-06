import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  @override
  void initState() {
    super.initState();
    getTime();
  }

  void getTime() async {
    Response response = await get(
        "http://worldtimeapi.org/api/timezone/Asia/Colombo");
    Map data = jsonDecode(response.body);
    // print(data);

    // get properties by data

    String dateTime = data['datetime'];
    String offSet = data['utc_offset'].substring(1,3);

    // create date time object

    DateTime now = DateTime.parse(dateTime);
    now =  now.add(Duration(hours: int.parse(offSet)));
    print(now);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading Screen"),
    );
  }
}
