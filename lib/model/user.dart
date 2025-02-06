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
  // String get fullName{
  //   return '${name.title} ${name.first} ${name.last}';
  // }
}
