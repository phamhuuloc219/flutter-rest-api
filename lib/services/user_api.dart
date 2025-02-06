import 'dart:convert';
import 'package:flutter_rest_api/model/user.dart';
import 'package:flutter_rest_api/model/user_avatar.dart';
import 'package:flutter_rest_api/model/user_name.dart';
import 'package:http/http.dart' as http;
class UserApi{

  static Future<List<User>> fetchUsers() async{
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final user = results.map((e) {
      final name = UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);
      final avt = UserAvatar(
          large: e['picture']['large'],
          medium: e['picture']['medium'],
          thumbnail: e['picture']['thumbnail']);
      return User(
        cell: e['cell'],
        email: e['email'],
        phone: e['phone'],
        nat: e['nat'],
        gender: e['gender'],
        name: name,
        avt: avt,
      );
    } ).toList();
    return user;
  }
}