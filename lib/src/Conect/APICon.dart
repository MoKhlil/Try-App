import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
class Network {
  final String _url = 'your server ';
  //if you are using android studio emulator, change localhost to 10.0.2.2
  var token;

  Future<String> fetchAlbum(var x) async {
    http.Response Res = await http.get(
        Uri.encodeFull('https://jsonplaceholder.typicode.com/posts'),
        headers: {
          "Accept": "application/" + x
        }
    );
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    localStorage.setString('Test', json.encode(Res.body));
    print(Res.body);

  }


}

