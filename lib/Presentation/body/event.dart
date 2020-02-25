import 'package:flutter/material.dart';

//From nasaAcadamy package.
import 'package:nasaadmin/Presentation/common/basicappbar.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.title),
                  labelText: "Title *",
                ),
                maxLength: 30,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Title must not empty";
                  }
                  if (value.length > 80 || value.length < 10) {
                    return "Enter Character b.n 5 and 30";
                  } else
                    return null;
                },
              ),
              SizedBox(
                height: 10.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.description),
                  labelText: "Body *",
                ),
                maxLength: 80,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Body must not empty";
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
                      "Post",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    color: Color.fromRGBO(0, 141, 81, 1.0),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text('Processing...')));
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ]));
  }
}
