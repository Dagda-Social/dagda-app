import '../../data/enum.dart';

class Page {
  int id;
  Language language;
  PageContentType contentType;
  String content;
  DateTime versionDate;

  Page({
    required this.id,
    required this.language,
    required this.contentType,
    required this.content,
    required this.versionDate,
  });

  factory Page.fromJson(Map<String, dynamic> json) {
    return Page(
      id: json['id'],
      language: json['language'],
      contentType: json['content_type'],
      content: json['content'],
      versionDate: json['version_date'],
    );
  }
}
