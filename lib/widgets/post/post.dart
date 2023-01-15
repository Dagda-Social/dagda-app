import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dagda/data/model/post.dart';
import 'package:dagda/widgets/badge/badge.dart';
import 'package:dagda/widgets/textbox/DagdaText.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:link_preview_generator/link_preview_generator.dart';

class UserPost extends StatelessWidget {
  UserPost({super.key, required this.post});

  final Post post;

  @override
  Widget build(BuildContext context) {
    List<String> links = [];
    RegExp exp =
        new RegExp(r'(?:(?:https?|ftp):\/\/)?[\w/\-?=%.]+\.[\w/\-?=%.]+');
    Iterable<RegExpMatch> matches = exp.allMatches(post.content);

    matches.forEach((match) {
      links.add(post.content.substring(match.start, match.end));
    });

    return Container(
        padding: const EdgeInsets.all(10),
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
            GestureDetector(
              onTap: () {
                context.go('/@${post.user.usertag}');
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    height: 50,
                    width: 50,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                                  Badge(badge: post.user.badge![i]),
                                Text(
                                  '@${post.user.usertag}',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300),
                                ),
                              ]),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            DagdaText(text: post.content!),
            const SizedBox(height: 10),
            if (links.isNotEmpty)
              LinkPreviewGenerator(
                link: links[1],
                bodyMaxLines: 1,
                linkPreviewStyle: LinkPreviewStyle.large,
                showBody: true,
                showGraphic: true,
                removeElevation: true,
              ),
            const SizedBox(height: 20),
            Text(
              '${post.creationDate.toLocal().day} ${post.creationDate.toLocal().month}/${post.creationDate.toLocal().year}',
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Colors.black54),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
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
            )
          ],
        ));
  }
}
