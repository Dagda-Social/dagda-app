
import '../../data/data.dart';

class AllowPrivateCategory {
  int id;
  Category userCategory;
  User allowedUser;

  AllowPrivateCategory({
    required this.id,
    required this.userCategory,
    required this.allowedUser,
  });

  factory AllowPrivateCategory.fromJson(Map<String, dynamic> json) {
    return AllowPrivateCategory(
      id: json['id'],
      userCategory: json['userCategory'],
      allowedUser: json['allowedUser'],
    );
  }
}
