import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Get Request',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String test = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(test,
                style: TextStyle(
                  fontFamily: 'Bravura',
                  fontSize: 32,
                ),
            ),
            Center( 
              child: Container(
                width: 150,    
                height: 60,
                child: FlatButton(
                  color: Colors.blue,
                  onPressed: () async {

                  final response = await http.get('http://127.0.0.1:5000');

                  final decoded = json.decode(response.body) as Map<String, dynamic>;

                  setState(() {
                    test = decoded['test'];
                  });

                  },
                  child: Text( 
                    'Press',
                    style: TextStyle(fontSize: 24,),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
