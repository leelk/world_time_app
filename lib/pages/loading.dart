import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}



class _LoadingState extends State<Loading> {


  void setupWorldTime() async {
    WorldTime instance =
    WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();

    Navigator.pushNamed(context, '/home',arguments: {
      'location': instance.location,
      'time': instance.time,
      'flag': instance.flag,
    });

  }
  @override
  void initState() {
    super.initState();
    setupWorldTime();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Text('Loading..'),
      ),
    );
  }
}
