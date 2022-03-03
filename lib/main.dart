import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  final String data = 'Passed Data From Top Level Widget';
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Level1(data: data),
    );
  }
}

class Level1 extends StatelessWidget {
  final String data;
  const Level1({required this.data, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data),
      ),
      body: Level2(data: data),
    );
  }
}

class Level2 extends StatelessWidget {
  final String data;
  const Level2({required this.data, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level3(data: data),
    );
  }
}

class Level3 extends StatelessWidget {
  final String data;
  const Level3({required this.data, Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(data);
  }
}

