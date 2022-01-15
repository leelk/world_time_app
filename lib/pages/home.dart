import 'dart:ui';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var data;

  @override
  Widget build(BuildContext context) {
    data =data.isNotEmpty ?data: ModalRoute.of(context)!.settings.arguments;
    print(data);

    // set background
    String bgImage = data['dayTime'] ? 'day.png' : 'night.png';
    Color? bgColor = data['dayTime'] ? Colors.blue : Colors.indigo[700];

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assests/$bgImage'),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/location');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'dayTime': result['dayTime'],
                      'flag': result['flag']
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                  color: Colors.deepOrange[900],
                ),
                label: Text(
                  'Edit Location',
                  style: TextStyle(
                    color: Colors.grey[300],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data['location'],
                    style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w900),
                  )
                ],
              ),
              SizedBox(height: 20.0),
              Text(data['time'],
                  style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w900)),
            ],
          ),
        ),
      )),
    );
  }
}
