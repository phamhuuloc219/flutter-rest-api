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

}
class UserName{
  final String title;
  final String first;
  final String last;

  UserName({required this.title, required this.first, required this.last});

}

class UserAvatar{
  final String large;
  final String medium;
  final String thumbnail;

  UserAvatar({required this.large, required this.medium, required this.thumbnail});
}