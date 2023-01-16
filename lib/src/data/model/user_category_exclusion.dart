import '../../data/data.dart';

class UserCategoryExclusion {
  int id;
  User parentUser;
  User excludedUser;
  Category category;

  UserCategoryExclusion({
    required this.id,
    required this.parentUser,
    required this.excludedUser,
    required this.category,
  });

  factory UserCategoryExclusion.fromJson(Map<String, dynamic> json) {
    return UserCategoryExclusion(
      id: json['id'],
      parentUser: json['parentUser'],
      excludedUser: json['excludedUser'],
      category: json['category'],
    );
  }
}
