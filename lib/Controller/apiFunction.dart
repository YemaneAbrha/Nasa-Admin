import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

// From nasa package
import 'package:nasaadmin/Model/Json/data.dart';

Future getMessage(BuildContext context) async {
  try {
    final url = 'http://192.168.137.169:8000/message';
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
    final url = 'http://192.168.137.10:8000/events';
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
    final url = "http://192.168.137.42:8000/messages/add";
    final jsonbody =
        await jsonEncode(body, toEncodable: (e) => json.decode((e)));
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

Future addEvent(BuildContext context, Map body) async {
  try {
    final url = "http://192.168.137.42:8000/events/add";
    final postUri = Uri.parse(url);
    var request = new http.MultipartRequest("POST", postUri);
    request.fields['title'] = body["title"];
    request.fields['body'] = body['body'];
    request.files
        .add(await http.MultipartFile.fromPath('image', body['image']));
    request.send().then((response) {
      if (response.statusCode == 200)
        print("Uploaded!");
      else {
        print(response.statusCode);
      }
    });
  } catch (e) {
    print(e);
  }
}

Future<List<Event>> getEvent(BuildContext context) async {
  final url = 'http://192.168.137.10:8000/events';
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
