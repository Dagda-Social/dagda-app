import '../../data/enum.dart';

class User {
  String id;
  String name;
  DateTime creationDate;
  bool public;
  List<Role> role;
  UserStatus userStatus;
  String usertag;
  String? profileImage;
  List<String>? badge;
  String biography;
  String? url;
  String? profileBanner;
  String birthdate;

  User({
    required this.id,
    required this.name,
    required this.creationDate,
    required this.public,
    required this.role,
    required this.userStatus,
    required this.usertag,
    required this.profileImage,
    required this.badge,
    required this.biography,
    required this.url,
    required this.profileBanner,
    required this.birthdate,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'].toString(),
      name: json['name'],
      creationDate: DateTime.parse(json['creationDate']),
      public: json['public'] as bool,
      role: json['role'],
      userStatus: json['userStatus'],
      usertag: json['usertag'],
      profileImage: json['profileImage'],
      badge: json['badge'],
      biography: json['biography'],
      url: json['url'],
      profileBanner: json['profileBanner'],
      birthdate: DateTime.parse(json['birthdate']).toString(),
    );
  }
}
