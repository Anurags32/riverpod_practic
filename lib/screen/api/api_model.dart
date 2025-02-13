import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:flutter_riverpod/flutter_riverpod.dart';

final postProvider = FutureProvider<List<Riverpod_Model>>((ref) async {
  try {
    final respons =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (respons.statusCode == 200) {
      final List<dynamic> data = jsonDecode(respons.body);
      List<Riverpod_Model> postList =
          data.map((e) => Riverpod_Model.fromJson(e)).toList();
      return postList;
    } else {
      throw "some things went wrong";
    }
  } catch (e) {
    rethrow;
  }
});

class Riverpod_Model {
  int? userId;
  int? id;
  String? title;
  String? body;

  Riverpod_Model({this.userId, this.id, this.title, this.body});

  Riverpod_Model.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}
