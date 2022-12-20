import 'package:dagda/screens/base_page/sizes/base_page_large.dart';
import 'package:dagda/screens/base_page/sizes/base_page_medium.dart';
import 'package:dagda/screens/base_page/sizes/base_page_small.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BasePage extends StatefulWidget {
  BasePage({Key? key, required this.content_type}) : super(key: key);
  final content_type;

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  String title = '';
  String content_type = '';
  String content = '';
  @override
  void initState() {
    content_type = widget.content_type;
    super.initState();
  }

  @override
  void dispose() {
    content_type = '';
    title = '';
    content = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (content_type) {
      case 'terms-of-service':
        title = AppLocalizations.of(context).termsOfService;
        content = """
# Dagda-app

A new Social Network

""";
        break;
      case 'privacy-policy':
        title = AppLocalizations.of(context).privacyPolicy;
        break;
      case 'about':
        title = AppLocalizations.of(context).about;
        break;
      default:
        title = AppLocalizations.of(context).termsOfService;
    }
    return Title(
        title: '$title - ${AppLocalizations.of(context).appName}',
        color: Colors.black,
        child: Scaffold(body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth < 600) {
            return BasePageSmall(title: title, content: content);
          } else if (constraints.maxWidth < 1200) {
            return BasePageMedium(title: title, content: content);
          } else {
            return BasePageLarge(title: title, content: content);
          }
        })));
  }
}
