import 'package:flutter/material.dart';

//From nasaAcadamy package.
import 'package:nasaadmin/Presentation/common/basicappbar.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Message"),
      ),
    );
  }
}
