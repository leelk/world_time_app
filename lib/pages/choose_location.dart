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
    print("init function called");
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
