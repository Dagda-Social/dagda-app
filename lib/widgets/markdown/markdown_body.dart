import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:url_launcher/url_launcher.dart';

class DagdaMarkdownBody extends StatelessWidget {
  const DagdaMarkdownBody({Key? key, required this.data}) : super(key: key);

  final String data;

  @override
  Widget build(BuildContext context) {
    return MarkdownBody(
        data: data,
        selectable: true,
        fitContent: true,
        onTapLink: (text, href, title) {
          launchUrl(Uri.parse(href.toString()));
        },
        softLineBreak: true,
        styleSheet: MarkdownStyleSheet(
          a: const TextStyle(
            color: Colors.blue,
            fontSize: 16,
          ),
          p: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          pPadding: const EdgeInsets.only(top: 8.0),
          h1: const TextStyle(color: Colors.black, fontSize: 32),
          h1Padding: const EdgeInsets.only(top: 8.0),
          h2: const TextStyle(color: Colors.black, fontSize: 24),
          h2Padding: const EdgeInsets.only(top: 8.0),
          h3: const TextStyle(color: Colors.black, fontSize: 20),
          h3Padding: const EdgeInsets.only(top: 8.0),
          h4: const TextStyle(color: Colors.black, fontSize: 16),
          h4Padding: const EdgeInsets.only(top: 8.0),
          h5: const TextStyle(color: Colors.black, fontSize: 14),
          h5Padding: const EdgeInsets.only(top: 8.0),
          h6: const TextStyle(color: Colors.black, fontSize: 12),
          h6Padding: const EdgeInsets.only(top: 8.0),
          em: const TextStyle(color: Colors.black, fontSize: 16),
          strong: const TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          code: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          codeblockDecoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          codeblockPadding: const EdgeInsets.all(10),
          codeblockAlign: WrapAlignment.start,
          checkbox: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          tableCellsDecoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          tableCellsPadding: const EdgeInsets.all(10),
          tableBorder: TableBorder.all(
            color: Colors.black,
            width: 1,
          ),
        ));
  }
}
