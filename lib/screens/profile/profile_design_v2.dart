import 'package:dagda/widgets/bottom_sheets/bottom_sheet.dart';
import 'package:dagda/widgets/buttons/icon_button.dart';
import 'package:dagda/widgets/buttons/outlined_button.dart';
import 'package:dagda/widgets/follow_check/follow_check.dart';
import 'package:dagda/widgets/textbox/DagdaText.dart';
import 'package:flutter/material.dart';

class ProfileWidget2 extends StatelessWidget {
  const ProfileWidget2({
    Key? key,
  }) : super(key: key);

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
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      DagdaIconButton(
                          icon: Icon(Icons.message_rounded), onPressed: () {}),
                      const SizedBox(
                        width: 10,
                      ),
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
                                    onChanged: (value) =>
                                        print('Category $i : $value'),
                                  )
                              ],
                              'Hide categories')),
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
                child: const Image(
                  width: 120,
                  height: 120,
                  image: AssetImage('images/profileIcon.png'),
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
  const ProfileInfo2({
    Key? key,
    required this.tag,
  }) : super(key: key);
  final String tag;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      verticalDirection: VerticalDirection.down,
      children: [
        const ProfileWidget2(),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                tag,
                style: const TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Wrap(
                children: [
                  GestureDetector(
                    onTap: () => bottomSheet(
                      context,
                      [
                        const SizedBox(
                          height: 20,
                        ),
                        const Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.verified_rounded,
                              color: Colors.blue,
                              size: 80,
                            )),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 8.0, right: 8.0, top: 16),
                          child: Text(
                            'This Account is Verified',
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Padding(
                          padding:
                              EdgeInsets.only(left: 8.0, right: 8.0, top: 16),
                          child: Text(
                            'This account is verified by Dagda. This means that Dagda has confirmed that this is the authentic account of the person or organization that it represents.',
                            style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.verified,
                        color: Colors.blue,
                        size: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 6,
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                '@$tag',
                style: const TextStyle(
                  fontFamily: 'Rubik',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: DagdaText(
            text:
                'Lorem ipsum dolor @daviddf sit https://dagda.social/privacy-policy #consectetur.  david@gmail.com pulvinar venenatis et nisl odio libero odio. Cras ut blandit ultricies pulvinar mauris bibendum convallis id nibh sollicitudin.',
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
      ],
    );
  }
}
