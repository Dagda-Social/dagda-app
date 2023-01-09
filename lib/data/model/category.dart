
import 'package:dagda/data/data.dart';

class Category {
  int id;
  String name;
  String description;
  String? image;
  bool nsfw;
  User? creator;

  Category({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.nsfw,
    required this.creator,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      nsfw: json['nsfw'],
      creator: json['creator'],
    );
  }
}
