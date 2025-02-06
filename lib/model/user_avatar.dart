
class UserAvatar{
  final String large;
  final String medium;
  final String thumbnail;

  UserAvatar({required this.large, required this.medium, required this.thumbnail});

  factory UserAvatar.fromMap(Map<String, dynamic> json){
    return UserAvatar(
        large: json['large'],
        medium: json['medium'],
        thumbnail: json['thumbnail']
    );
  }
}