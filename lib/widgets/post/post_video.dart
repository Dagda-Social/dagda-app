import 'package:cached_network_image/cached_network_image.dart';
import 'package:dagda/src/screens/screens.dart';
import 'package:dagda/widgets/badge/badge.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../src/data/data.dart';

class UserVideo extends StatelessWidget {
  const UserVideo({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Container(

        margin: const EdgeInsets.only(bottom: 20.0, left: 10, right: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            shape: BoxShape.rectangle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ]),
        child: Column(
          verticalDirection: VerticalDirection.down,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10)),
                    child: Image.network(
                      "https://picsum.photos/1080/1080",
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
            GestureDetector(
              onTap: () {
                if (kIsWeb) context.go('/@${post.user.usertag}');
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Profile(
                          id: post.user.usertag,
                        )));
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(right: 20.0),
                      height: 40,
                      width: 40,
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image(
                          width: double.infinity,
                          fit: BoxFit.cover,
                          height: 160,
                          image: CachedNetworkImageProvider(
                              post.user.profileImage ??
                                  'https://picsum.photos/200/300'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                children: [
                                  Text(post.user.name,
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold)),
                                  for (var i = 0;
                                      i < post.user.badge!.length;
                                      i++)
                                    Badge(
                                      badge: post.user.badge![i],
                                      iconSize: 20,
                                    ),
                                ]),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                ' ${post.creationDate.toLocal().day}/${post.creationDate.toLocal().month}/${post.creationDate.toLocal().year}',
                                style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black54),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                '200 likes',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                '0 comments',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

          ],
        ));
  }
}
