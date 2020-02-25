import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

// From nasa package
import 'package:nasaadmin/Model/Json/data.dart';

Future getMessage(BuildContext context) async {
  try {
    final url = 'http://10.0.2.2:3000/message';
    http.Response response = await http.get(url, headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    });
    final message = jsonDecode(response.body);
    return message;
  } catch (e) {
    print(e);
  }
  try {
    final url = 'http://10.0.2.2:3000/events';
    http.Response response = await http.get(
      url,
      headers: {
        "Accept": "application/json",
        // "Content-Type": "application/json"
      },
    );
    final event = jsonDecode(response.body);
    return event;
  } catch (e) {}
}

Future sendMessage(BuildContext context, Map<String, dynamic> body) async {
  try {
    final url = "http://10.0.2.2:8000/messages/add";
    print(body);
    final jsonbody =
        await jsonEncode(body, toEncodable: (e) => json.decode((e)));
    print("I am Here");
    print(jsonbody);
    http.Response response = await http.post(
      url,
      body: jsonbody,
      headers: {
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      print("Sent Successfully");
    } else {
      print("Message Not Sent");
    }
  } catch (e) {
    print(e);
  }
}

Future<List<Event>> getEvent(BuildContext context) async {
  final url = 'http://10.0.2.2:8000/events';
  try {
    http.Response response = await http.get(
      url,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
    );
    final datas = jsonDecode(response.body);
    List<Event> events = [];
    for (var data in datas) {
      print(data);
      Event event = Event(
        data["_id"],
        data["title"],
        data["body"],
        data["image"],
      );
      events.add(event);
    }
    print(events);
    return events;
  } catch (err) {
    print(err);
  }
}
