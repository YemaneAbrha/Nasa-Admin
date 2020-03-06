import 'package:flutter/widgets.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

// From nasa package

Future getMessage(BuildContext context) async {
  try {
    final url = 'https://nasa-academy.herokuapp.com/messages';
    http.Response response = await http.get(
      url,
      headers: {
        "Accept": "application/json",
      },
    );

    final event = jsonDecode(response.body);
    return event;
  } catch (e) {
    print(e);
  }
}

Future sendMessage(BuildContext context, Map<String, dynamic> body) async {
  try {
    final url = "https://nasa-academy.herokuapp.com/messages/add";
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
    final url = "https://nasa-academy.herokuapp.com/events/add";
    final postUri = Uri.parse(url);
    var request = new http.MultipartRequest("POST", postUri);
    request.fields['title'] = body["title"];
    request.fields['body'] = body['body'];
    request.files
        .add(await http.MultipartFile.fromPath('image', body['image']));
    request.send().then((response) {
      if (response.statusCode == 200) {
        print("Uploaded!");
        return response.statusCode;
      } else {
        print("Unploaded ");
        return response.statusCode;
      }
    });
  } catch (e) {
    print(e);
  }
}
