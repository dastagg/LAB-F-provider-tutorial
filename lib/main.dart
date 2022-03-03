import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PassedData extends ChangeNotifier {
  String _data = 'Passed Data';

  String get data => _data;

  void updateString(String data) {
    _data = data;
    notifyListeners();
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PassedData(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: MyText(),
          ),
          body: Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MyTextField(),
        Level3(),
      ],
    );
  }
}

class Level3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(context.watch<PassedData>().data,);
  }
}

class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Changing this from watch to read loads the data the first time but not on updates.
    return Text(context.read<PassedData>().data,);
  }
}

class MyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        context.read<PassedData>().updateString(newText);
      },
    );
  }
}

