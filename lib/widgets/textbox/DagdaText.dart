import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:linkfy_text/linkfy_text.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:go_router/go_router.dart';

class DagdaText extends StatelessWidget {
  DagdaText({Key? key, required this.text}) : super(key: key);
  final String text;
  final RegExp _userTagRegExp = RegExp(r'@([a-zA-Z0-9_]+)');
  final RegExp _hashTagRegExp = RegExp(r'#([a-zA-Z0-9_]+)');
  final RegExp _urlRegExp = RegExp(
      r'((http|https|ftp):\/\/)?[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?');
  final RegExp _emailRegExp =
      RegExp(r'([a-zA-Z0-9\.+-]+@[a-zA-Z0-9]+\.[a-zA-Z0-9\.]+)');
  @override
  Widget build(BuildContext context) {
    return LinkifyText(
      text,
      onTap: (link) {
        if (kDebugMode) {
          print('Link: ${link.value} ${link.type}');
        }

        if (link.value!.contains(_emailRegExp)) {
          launchUrl(Uri.parse('mailto:${link.value}'),
              mode: LaunchMode.externalApplication);
        } else if (link.value!.contains(_userTagRegExp)) {
          if (kIsWeb) context.go('/${link.value!}');
          context.push('/${link.value!}');
        } else if (link.value!.contains(_hashTagRegExp)) {
          if (kIsWeb) context.go('/search?hashtag=${link.value!.substring(1)}');
          context.push('/search?hashtag=${link.value!.substring(1)}');
        } else if (link.value!.contains(_urlRegExp)) {
          launchUrl(Uri.parse(link.value!),
              mode: LaunchMode.externalApplication);
        }
      },
      textStyle: const TextStyle(
        fontFamily: 'Rubik',
        fontSize: 14,
      ),
      linkStyle: const TextStyle(
        fontFamily: 'Rubik',
        fontSize: 14,
        fontWeight: FontWeight.bold,
        color: Colors.blue,
      ),
      linkTypes: const [
        LinkType.userTag,
        LinkType.url,
        LinkType.hashTag,
        LinkType.email
      ],
    );
  }
}
