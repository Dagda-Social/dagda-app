import 'package:dagda/screens/base_page/prephabs.dart';
import 'package:dagda/screens/base_page/sizes/base_page_large.dart';
import 'package:dagda/screens/base_page/sizes/base_page_medium.dart';
import 'package:dagda/screens/base_page/sizes/base_page_small.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key, required this.contentType}) : super(key: key);
  final String contentType;

  @override
  State<BasePage> createState() => _BasePageState();
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('content_type', contentType));
  }
}

class _BasePageState extends State<BasePage> {
  String title = '';
  String contentType = '';
  String content = '';
  @override
  void initState() {
    contentType = widget.contentType;
    super.initState();
  }

  @override
  void dispose() {
    contentType = '';
    title = '';
    content = '';
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    getContent(context);
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

  void getContent(BuildContext context) {
    switch (contentType) {
      case 'terms-of-service':
        title = AppLocalizations.of(context).termsOfService;
        content = termsOfService;
        break;
      case 'privacy-policy':
        title = AppLocalizations.of(context).privacyPolicy;
        content = privacyPolicy;
        break;
      case 'about':
        title = AppLocalizations.of(context).about;
        content = about;
        break;
      case 'profile-info':
        title = "Profile Info";
        String token = "";
        FirebaseAuth.instance.currentUser?.getIdToken().then((value) {
          token = value.toString();
          setState(() {
            content = token;
          });
        });

        break;
      default:
        title = AppLocalizations.of(context).appName;
    }
  }
}
