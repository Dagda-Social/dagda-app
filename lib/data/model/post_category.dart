import 'package:dagda/data/data.dart';


class PostCategory {
  int id;
  Post post;
  Category category;

  PostCategory({
    required this.id,
    required this.post,
    required this.category,
  });

  factory PostCategory.fromJson(Map<String, dynamic> json) {
    return PostCategory(
      id: json['id'],
      post: json['post'],
      category: json['category'],
    );
  }
}
