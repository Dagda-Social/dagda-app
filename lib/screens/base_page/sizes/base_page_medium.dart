import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class BasePageMedium extends StatefulWidget {
  BasePageMedium({Key? key, required this.title, required this.content})
      : super(key: key);
  String title;
  String content;

  @override
  State<BasePageMedium> createState() => _BasePageMediumState();
}

class _BasePageMediumState extends State<BasePageMedium> {
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
                fontSize: 42)),
        shadowColor: const Color.fromARGB(0, 0, 0, 0),
        actions: <Widget>[
          Center(
            child: TextButton(
              onPressed: () => context.go('/login'),
              child: Text(
                AppLocalizations.of(context).login,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
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
                    fontSize: 16,
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
                  constraints: const BoxConstraints(minWidth: 400,maxWidth: 600),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BasePageContent(
                            title: widget.title, content: widget.content),
                      ),
                      BasePageFooter(),
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
  BasePageContent({Key? key, required this.title, required this.content})
      : super(key: key);
  String title;
  String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 400,maxWidth: 600),
          child: Text(
            title,
            style: const TextStyle(
                color: Colors.black, fontSize: 32, fontWeight: FontWeight.bold),
            textAlign: TextAlign.start,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(minWidth: 400,maxWidth: 600),
          child: MarkdownBody(
              onTapLink: (text, href, title) {
                launchUrl(Uri.parse(href.toString()));
              },
              data: content,
              selectable: false,
              styleSheet: MarkdownStyleSheet(
                p: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                h1: const TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold),
                h2: const TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
                h3: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                h4: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                h5: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
                h6: const TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
                em: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                strong: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                code: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                codeblockDecoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                codeblockPadding: const EdgeInsets.all(10),
                codeblockAlign: WrapAlignment.start,
                checkbox: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                tableCellsDecoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                tableCellsPadding: const EdgeInsets.all(10),
                tableBorder: TableBorder.all(
                  color: Colors.black,
                  width: 1,
                ),
              )),
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
          'Last updated: 2022-12-09',
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
