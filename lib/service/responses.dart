import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:developer';

Future<List<ToDo>> getting() async {
  var answer;
  String username = 'admin';
  String password = 'district';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));
  debugPrint(basicAuth);
  http.Response response = await http.get(
    Uri.parse(
        'https://dev.hisptz.com/dhis2/api/dataStore/ireneScarion?fields=.'),
    headers: <String, String>{'Authorization': basicAuth},
  );
  debugPrint("response");

  answer = jsonDecode(response.body);
  debugPrint("doooo");
  final entries = answer['entries'];

  List<ToDo> mylist = [];
  for (var entry in entries) {
    var value = entry['value'];
    ToDo data = ToDo.fromJson(
        value); // Replace with your own data model or conversion logic
    mylist.add(data);
  }

  print(mylist);

  return mylist;
}

Future<List<ToDo>> getToDo() async {
  return await getting();
}

class ToDo {
  final String id;
  final String title;
  final String description;
  bool completed = false;
  String created = '';
  String lastUpdated = '';

  ToDo(
      {required this.title,
      required this.id,
      required this.description,
      required this.completed,
      required this.created,
      required this.lastUpdated});

  static ToDo fromJson(Map<String, dynamic> json) {
    return ToDo(
      title: json['title'],
      id: json['id'] as String,
      description: json['description'] as String,
      completed: json['completed'],
      created: json['created'] as String,
      lastUpdated: json['lastUpdated'] as String,
    );
  }
}

void addToDo(Map item) async {
  String username = 'admin';
  String password = 'district';
  String basicAuth =
      'Basic ' + base64Encode(utf8.encode('$username:$password'));

  var id = item['id'];
  debugPrint('$id');

  final response = await http.post(
      Uri.parse('https://dev.hisptz.com/dhis2/api/dataStore/ireneScarion/$id'),
      body: jsonEncode(item),
      headers: <String, String>{
        'authorization': basicAuth,
        'Content-Type': 'application/json'
      });

  print(response.body);
}
