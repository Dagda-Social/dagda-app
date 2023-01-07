
import 'package:dagda/widgets/buttons/outlined_button.dart';
import 'package:dagda/widgets/follow_check/follow_check.dart';
import 'package:flutter/material.dart';

import '../../widgets/bottom_sheets/bottom_sheet.dart';

class ProfileInfo extends StatelessWidget {
  const ProfileInfo({
    Key? key,
    required this.tag,
  }) : super(key: key);
  final String tag;
  @override
  Widget build(BuildContext context) {
    return Column(
      verticalDirection: VerticalDirection.down,
      children: [
        const ProfileWidget(),
        Text(
          tag,
          style: const TextStyle(
            fontFamily: 'Rubik',
            fontSize: 26,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Text(
          '@$tag',
          style: const TextStyle(
            fontFamily: 'Rubik',
            fontSize: 16,
            fontWeight: FontWeight.bold,
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
              width: 20,
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
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Text(
              'Lorem ipsum dolor sit amet consectetur. Nunc aliquam pulvinar venenatis et nisl odio libero odio. Cras ut blandit ultricies pulvinar mauris bibendum convallis id nibh sollicitudin.',
              style: TextStyle(
                fontFamily: 'Rubik',
                fontSize: 14,
                fontWeight: FontWeight.bold,
              )),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DagdaOutlinedButton(
                title: 'Follow',
                onPressed: () => bottomSheetFollow(
                    context,
                    [
                      for (var i = 0; i < 20; i++)
                        DagdaFollowCheck(
                          title: Text(
                            'Category $i',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16),
                          ),
                          onChanged: (value) => print('Category $i : $value'),
                        )
                    ],
                    'Hide categories')),
            const SizedBox(
              width: 20,
            ),
            DagdaOutlinedButton(title: 'Message', onPressed: () {}),
          ],
        ),
      ],
    );
  }
}

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: Stack(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Positioned(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
              child: const ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: Image(
                  width: double.infinity,
                  fit: BoxFit.cover,
                  height: 160,
                  image: AssetImage('images/profile_banner.jpg'),
                ),
              ),
            ),
          )),
          Positioned.fill(
            top: 100,
            child: Align(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                    width: 4,
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
                  child: const Image(
                    width: 120,
                    height: 120,
                    image: AssetImage('images/profileIcon.png'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

