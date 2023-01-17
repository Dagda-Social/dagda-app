import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dagda/src/screens/screens.dart';
import 'package:dagda/src/widgets/badge/badge.dart';
import 'package:dagda/src/widgets/textbox/DagdaText.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:link_preview_generator/link_preview_generator.dart';

import '../../data/data.dart';

class UserPost extends StatefulWidget {
  const UserPost({super.key, required this.post});

  final Post post;

  @override
  State<UserPost> createState() => _UserPostState();
}

class _UserPostState extends State<UserPost> {
  List<String> _links = [];
  RegExp exp = RegExp(
      r'((http|https|ftp):\/\/)[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?');

  @override
  void initState() {
    super.initState();
    _links =
        exp.allMatches(widget.post.content).map((e) => e.group(0)!).toList();
    log('Post: ${widget.post.id}');
    log('Links: $_links');
  }

  @override
  void dispose() {
    _links = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                if (kIsWeb) context.go('/@${widget.post.user.usertag}');
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Profile(
                          id: widget.post.user.usertag,
                        )));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 20.0),
                    height: 40,
                    width: 40,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      child: Image(
                        width: double.infinity,
                        fit: BoxFit.cover,
                        height: 160,
                        image: CachedNetworkImageProvider(
                            widget.post.user.profileImage ??
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
                                Text(widget.post.user.name,
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                                for (var i = 0;
                                    i < widget.post.user.badge!.length;
                                    i++)
                                  Badge(
                                    badge: widget.post.user.badge![i],
                                    iconSize: 20,
                                  ),
                              ]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              '@${widget.post.user.usertag}',
                              style: const TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w300),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            DagdaText(text: widget.post.content),
            const SizedBox(height: 10),
            if (_links.isNotEmpty)
              Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: LinkPreviewGenerator(
                  link: _links[0],
                  bodyMaxLines: 3,
                  linkPreviewStyle: LinkPreviewStyle.small,
                  showBody: true,
                  showGraphic: true,
                  removeElevation: true,
                  showTitle: true,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 20),
            Text(
              '${widget.post.creationDate.toLocal().day} ${widget.post.creationDate.toLocal().month}/${widget.post.creationDate.toLocal().year}',
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
                  children: const [
                    Text(
                      '200 likes',
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    SizedBox(width: 10),
                    Text(
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
