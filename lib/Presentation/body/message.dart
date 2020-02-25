import 'package:flutter/material.dart';

//From nasaAcadamy package.
import 'package:nasaadmin/Presentation/common/basicappbar.dart';

class MessagePage extends StatefulWidget {
  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              icon: Icon(Icons.message),
              labelText: "Message *",
            ),
            maxLength: 80,
            validator: (value) {
              if (value.isEmpty) {
                return "Message must not empty";
              }
              if (value.length > 80 || value.length < 10) {
                return "Enter Character b.n 10 and 80";
              } else
                return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                child: Text(
                  "Send",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                color: Color.fromRGBO(0, 141, 81, 1.0),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    Scaffold.of(context)
                        .showSnackBar(SnackBar(content: Text('Processing...')));
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
