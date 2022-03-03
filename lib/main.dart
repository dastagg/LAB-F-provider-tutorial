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
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PassedData(),
      child: MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const MyText(),
          ),
          body: const Level1(),
        ),
      ),
    );
  }
}

class Level1 extends StatelessWidget {
  const Level1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Level2(),
    );
  }
}

class Level2 extends StatelessWidget {
  const Level2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        MyTextField(),
        Level3(),
      ],
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

class MyText extends StatelessWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Changing this from watch to read loads the data the first time but not on updates.
    return Text(context.read<PassedData>().data,);
  }
}

class MyTextField extends StatelessWidget {
  const MyTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        context.read<PassedData>().updateString(newText);
      },
    );
  }
}

