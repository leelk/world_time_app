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
    getData();
    print("init function called");
  }

  void getData() async {

    Response response = await get("https://jsonplaceholder.typicode.com/todos/1");

    Map data = jsonDecode(response.body);
    print(data['title'] + "came the title as fresh.");


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text("Loading Screen"),
    );
  }
}
