import 'package:dagda/widgets/markdown/markdown_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BasePageSmall extends StatelessWidget {
  BasePageSmall({Key? key, required this.title, required this.content})
      : super(key: key);
  String title;
  String content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 60,
        centerTitle: false,
        titleSpacing: 20.0,
        title: Text(AppLocalizations.of(context).appName,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 38)),
        shadowColor: const Color.fromARGB(0, 0, 0, 0),
        actions: <Widget>[
          Center(
            child: TextButton(
              onPressed: () => context.go('/login'),
              child: Text(
                AppLocalizations.of(context).login,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            width: 40,
          ),
          Center(
            child: TextButton(
              onPressed: () => context.go('/register'),
              child: Text(
                AppLocalizations.of(context).register,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            width: 40,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width * 0.8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      BasePageContent(
                          title: title, content: content),
                      const BasePageFooter(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class BasePageContent extends StatelessWidget {
  const BasePageContent({Key? key, required this.title, required this.content})
      : super(key: key);
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
              color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        const SizedBox(
          height: 40,
        ),
        ConstrainedBox(
          constraints:
              BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.8),
          child: DagdaMarkdownBody(
            data: content,
          ),
        )
      ],
    );
  }
}

class BasePageFooter extends StatelessWidget {
  const BasePageFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        SizedBox(
          height: 40,
        ),
        Text(
          'Last updated: 2022-12-28',
          style: TextStyle(
              color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          textAlign: TextAlign.start,
        ),
        SizedBox(
          height: 100,
        ),
      ],
    );
  }
}
