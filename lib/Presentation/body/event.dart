import 'dart:async';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

//From nasaAcadamy package.
import 'package:nasaadmin/Controller/apiFunction.dart';

class EventPage extends StatefulWidget {
  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final _formKey = GlobalKey<FormState>();
  String _base64Image;
  String _fileName;
  String _title;
  String _body;
  File _file;
  int _complete = 0;
  bool _isbuttonDisable = false;
  void _choose() async {
    File _selected = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() async {
      _file = _selected;
    });
  }

  void _upload(body) async {
    var status;
    setState(() async {
      status = await addEvent(context, body);
    });

    if (status == 200) {
      setState(() {
        _complete = 1;
        _isbuttonDisable = true;
      });
    } else {
      setState(() {
        _complete = -1;
        _isbuttonDisable = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Center(
                  child: RaisedButton(
                onPressed: _choose,
                child: Row(
                  children: <Widget>[
                    Icon(Icons.image),
                    SizedBox(width: 3),
                    Text("Choose Image")
                  ],
                ),
              )),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.title),
                  labelText: "Title *",
                ),
                maxLength: 30,
                validator: (value) {
                  if (value.isEmpty) {
                    return "Title Must Not Empty";
                  }
                  if (value.length > 80 || value.length < 10) {
                    return "Enter Character b.n 5 and 30";
                  } else {
                    setState(() {
                      _title = value;
                    });

                    return null;
                  }
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
                  } else {
                    setState(() {
                      _body = value;
                    });
                    return null;
                  }
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
                            SnackBar(content: Text('Validating...')));
                        Map body = {
                          'title': _title,
                          'body': _body,
                          'image': _file.path
                        };
                        _upload(body);
                        if (_complete == 0) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text("Uploading....")));
                        } else if (_complete == 1) {
                          Scaffold.of(context)
                              .showSnackBar(SnackBar(content: Text("Uploade")));
                        } else if (_complete == -1) {
                          Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text("Error in Uploading")));
                        }
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
