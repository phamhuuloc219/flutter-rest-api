import 'dart:convert';
import 'package:flutter_rest_api/model/user.dart';
import 'package:flutter_rest_api/model/user_avatar.dart';
import 'package:flutter_rest_api/model/user_dob.dart';
import 'package:flutter_rest_api/model/user_location.dart';
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
          last: e['name']['last']
      );
      final avt = UserAvatar(
          large: e['picture']['large'],
          medium: e['picture']['medium'],
          thumbnail: e['picture']['thumbnail']
      );
      final date = e['dob']['date'];
      final dob = UserDob(
          age: e['dob']['age'],
          date: DateTime.parse(date),
      );
      final coordinates = LocationCoordinates(
          longitude: e['location']['coordinates']['longitude'],
          latitude: e['location']['coordinates']['latitude']);
      final street = LocationStreet(
          number: e['location']['street']['number'],
          name: e['location']['street']['name']
      );
      final timezone = LocationTimezone(
          offset: e['location']['timezone']['offset'],
          description: e['location']['timezone']['description']
      );
      final location = UserLocation(
          city: e['location']['city'],
          state: e['location']['state'],
          country: e['location']['country'],
          postcode: e['location']['postcode'].toString(),
          coordinates: coordinates,
          street: street,
          timezone: timezone
      );
      return User(
        cell: e['cell'],
        email: e['email'],
        phone: e['phone'],
        nat: e['nat'],
        gender: e['gender'],
        name: name,
        avt: avt,
        dob: dob,
        location: location,
      );
    }).toList();
    return user;
  }
}