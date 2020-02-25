import 'package:flutter/material.dart';

// From nasa package
import 'package:nasaadmin/Presentation/common.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: <String, WidgetBuilder>{},
      title: 'ናሳ ት/ቤት',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CommonPage(),
    );
  }
}
