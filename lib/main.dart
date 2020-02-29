import 'package:flutter/material.dart';

// From nasa package
import 'package:nasaadmin/Presentation/common.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ናሳ ት/ቤት',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(0, 141, 81, 1.0),
      ),
      home: CommonPage(),
    );
  }
}
