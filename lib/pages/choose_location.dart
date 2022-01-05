import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  int counter = 0;



  @override
  void initState() {
    super.initState();
    getData();
    print("init function called");
  }

  void getData() async {
    // Simulate network request for a username.
    String name = await Future.delayed(Duration(seconds: 2), (){
      return "Leel";
    });

    // Simulate network request to get bio of the username
    String bio = await Future.delayed(Duration(seconds: 1), (){
      return "SE- Sri Lanka";
    });

    print('$name + ' ' + $bio');
  }

  @override
  Widget build(BuildContext context) {
    print("Build function called");
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: RaisedButton(onPressed: (){
        setState(() {
          counter += 1;
        });
      }, child: Text('Counter is :  $counter'),),
    );
  }
}
