import 'package:flutter/material.dart';
import 'package:linkfy_text/linkfy_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';

class DagdaText extends StatelessWidget {
  const DagdaText({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return LinkifyText(
      text,
      onTap: (link) {
        if (link.type == LinkType.userTag) {
          context.go('/${link.value}');
        } else if (link.type == LinkType.hashTag) {
          context.go('/search?hashtag=${link.value!.substring(1)}');
        } else if (link.type == LinkType.url) {
          launchUrl(Uri.parse(link.value!),
              mode: LaunchMode.externalApplication);
        }
      },
      textStyle: const TextStyle(
        fontFamily: 'Rubik',
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
      linkStyle: const TextStyle(
        fontFamily: 'Rubik',
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      linkTypes: const [
        LinkType.url,
        LinkType.userTag,
        LinkType.hashTag,
        LinkType.email
      ],
    );
  }
}
