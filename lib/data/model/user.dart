import 'package:dagda/data/enum.dart';

class User {
  String id;
  String name;
  DateTime creationDate;
  bool public;
  Enum role;
  UserStatus userStatus;
  String usertag;
  String? profileImage;
  String? badge;
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
      id: json['id'],
      name: json['name'],
      creationDate: json['creation_date'],
      public: json['public'],
      role: json['role'],
      userStatus: json['user_status'],
      usertag: json['usertag'],
      profileImage: json['profile_image'],
      badge: json['badge'],
      biography: json['biography'],
      url: json['url'],
      profileBanner: json['profile_banner'],
      birthdate: json['birthdate'],
    );
  }
}
