import 'package:flutter_rest_api/model/user_avatar.dart';
import 'package:flutter_rest_api/model/user_name.dart';

class User{
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserAvatar avt;
  User({
    required this.avt,
    required this.name,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.gender
  });
  // String get fullName{
  //   return '${name.title} ${name.first} ${name.last}';
  // }
}
