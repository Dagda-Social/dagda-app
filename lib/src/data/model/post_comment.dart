import '../../data/data.dart';


class PostComment {
  int id;
  Post parent;
  Post child;

  PostComment({
    required this.id,
    required this.parent,
    required this.child,
  });

  factory PostComment.fromJson(Map<String, dynamic> json) {
    return PostComment(
      id: json['id'],
      parent: json['parent'],
      child: json['child'],
    );
  }
}
