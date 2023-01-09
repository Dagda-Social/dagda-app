import 'package:dagda/data/data.dart';


class UserCategory {
  int id;
  bool public;
  User user;
  Category category;

  UserCategory({
    required this.id,
    required this.public,
    required this.user,
    required this.category,
  });

  factory UserCategory.fromJson(Map<String, dynamic> json) {
    return UserCategory(
      id: json['id'],
      public: json['public'],
      user: json['user'],
      category: json['category'],
    );
  }
}
