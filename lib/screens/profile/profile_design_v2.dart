import 'package:cached_network_image/cached_network_image.dart';
import 'package:dagda/data/mockupdata/user_mockup.dart';
import 'package:dagda/data/model/user.dart';
import 'package:dagda/widgets/badge/badge.dart';
import 'package:dagda/widgets/bottom_sheets/bottom_sheet.dart';
import 'package:dagda/widgets/buttons/icon_button.dart';
import 'package:dagda/widgets/buttons/outlined_button.dart';
import 'package:dagda/widgets/follow_check/follow_check.dart';
import 'package:dagda/widgets/textbox/DagdaText.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class ProfileWidget2 extends StatelessWidget {
  ProfileWidget2({
    Key? key,
    required this.user,
  }) : super(key: key);
  User user;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Stack(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Positioned(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: 160,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          spreadRadius: 4,
                        )
                      ]),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Image(
                      width: double.infinity,
                      fit: BoxFit.cover,
                      height: 160,
                      image: CachedNetworkImageProvider(user.profileBanner!),
                    ),
                  ),
                ),
                if (GoRouter.of(context).location != '/profile' ||
                    user.usertag != 'daviddf')
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DagdaIconButton(
                            icon: const Icon(Icons.message_rounded),
                            onPressed: () {}),
                        const SizedBox(
                          width: 10,
                        ),
                        DagdaOutlinedButton(
                            title: 'Follow',
                            onPressed: () => bottomSheetFollow(
                                context,
                                [
                                  for (var i = 0; i < categories.length; i++)
                                    DagdaFollowCheck(
                                      title: Text(
                                        categories[i].name,
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16),
                                      ),
                                      onChanged: (value) =>
                                          print('Category $i : $value'),
                                    )
                                ],
                                'Hide categories')),
                      ],
                    ),
                  )
                else
                  Padding(
                    padding: const EdgeInsets.all(6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        DagdaOutlinedButton(
                            title: 'Edit profile', onPressed: () {}),
                      ],
                    ),
                  ),
              ],
            ),
          )),
          Positioned(
            top: 120,
            left: 40,
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: Colors.white,
                border: Border.all(
                  color: Colors.white,
                  width: 5,
                ),
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 10,
                    color: Colors.black12,
                    offset: Offset(0, 4),
                  )
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image(
                  width: 120,
                  height: 120,
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(user.profileImage!),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileInfo2 extends StatelessWidget {
  ProfileInfo2({
    Key? key,
    required this.user,
  }) : super(key: key);
  User user;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      verticalDirection: VerticalDirection.down,
      children: [
        ProfileWidget2(user: user),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 24),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  user.name,
                  style: const TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.start,
                ),
                for (var i = 0; i < user.badge!.length; i++)
                  Badge(badge: user.badge![i]),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '@${user.usertag}',
                style: const TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: DagdaText(
            text: user.biography,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: const [
                Text(
                  '178K',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Followers',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 40,
            ),
            Column(
              children: const [
                Text(
                  '209',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Following',
                  style: TextStyle(
                    fontFamily: 'Rubik',
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
