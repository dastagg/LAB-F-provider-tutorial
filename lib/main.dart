import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class PassedData with ChangeNotifier {
  final String _data = 'New Passed Data From Top Level Widget';

  String get data => _data;

  void updateString() {
    notifyListeners();
  }

}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<PassedData>(
      create: (context) =>  PassedData(),
      dispose: (context, value) => value.dispose(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Level1(),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  const Level1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.watch<PassedData>().data,),
      ),
      body: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  const Level2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level3(),
    );
  }
}

class Level3 extends StatelessWidget {
  const Level3({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Text(context.watch<PassedData>().data,);
  }
}

