import 'package:flutter_rest_api/model/user_avatar.dart';
import 'package:flutter_rest_api/model/user_dob.dart';
import 'package:flutter_rest_api/model/user_location.dart';
import 'package:flutter_rest_api/model/user_name.dart';

class User{
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserAvatar avt;
  final UserDob dob;
  final UserLocation location;
  User({
    required this.avt,
    required this.name,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.gender,
    required this.dob,
    required this.location
  });

  factory User.fromMap(Map<String, dynamic> e){
    final name = UserName.fromMap(e['name']);
    final avt = UserAvatar.fromMap(e['picture']);
    final dob = UserDob.fromMap(e['dob']);
    final location = UserLocation.fromMap(e['location']);
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
  }

  String get fullName{
    return '${name.title} ${name.first} ${name.last}';
  }
}
