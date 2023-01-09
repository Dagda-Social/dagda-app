import 'package:dagda/data/data.dart';
import 'package:dagda/data/enum.dart';

class Post {
  int id;
  User user;
  PostStatus status;
  ContentType contentType;
  DateTime creationDate;
  String content;
  bool isTopLevel;

  Post({
    required this.id,
    required this.user,
    required this.status,
    required this.contentType,
    required this.creationDate,
    required this.content,
    required this.isTopLevel,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      user: json['user'],
      status: json['status'],
      contentType: json['content_type'],
      creationDate: json['creation_date'],
      content: json['content'],
      isTopLevel: json['is_top_level'],
    );
  }
}
