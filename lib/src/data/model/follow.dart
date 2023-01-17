import '../../data/data.dart';

class Follow {
  int id;
  User user;
  User following;

  Follow({
    required this.id,
    required this.user,
    required this.following,
  });

  factory Follow.fromJson(Map<String, dynamic> json) {
    return Follow(
      id: json['id'],
      user: json['user'],
      following: json['following'],
    );
  }
}
