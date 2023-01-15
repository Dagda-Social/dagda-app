import 'package:cached_network_image/cached_network_image.dart';
import 'package:dagda/data/enum.dart';
import 'package:dagda/data/mockupdata/user_mockup.dart';
import 'package:dagda/widgets/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            title: Text(
              AppLocalizations.of(context).appName,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                  fontFamily: 'Comfortaa'),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.all(6.0),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: IconButton(
                  icon: const Icon(Icons.message_rounded),
                  iconSize: 30,
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                      child: ListView.builder(
                          itemCount: posts.length,
                          padding: EdgeInsets.only(top: 20),
                          itemBuilder: ((context, index) {
                            if (posts[index].contentType == ContentType.post)
                              return UserPost(
                                  key: ValueKey(posts[index].id),
                                  post: posts[index]);
                            return Container(
                              margin: const EdgeInsets.only(bottom: 20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 20.0),
                                    height: 40,
                                    width: 40,
                                    child: const ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      child: Image(
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        height: 160,
                                        image: CachedNetworkImageProvider(
                                            'https://picsum.photos/200/300'),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'daviddf',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              fontFamily: 'Comfortaa'),
                                        ),
                                        // Create a new Text widget with the following properties.
                                        Text(
                                          // The text to display.
                                          'Dagda is a social network./n nikapsihdpashdipasdkjfasñkfasd',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                            fontSize: 16,
                                            fontFamily: 'Comfortaa',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
