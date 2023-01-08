import 'package:dagda/screens/profile/profile_design_v2.dart';
import 'package:dagda/widgets/search/search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Profile extends StatelessWidget {
  final String id;
  const Profile({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (buildContext, constraints) {
      if (constraints.maxWidth > 800) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Stack(children: [
                    Positioned(
                      child: ListView(
                        children: [
                          ProfileInfo2(tag: id),
                        ],
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GoRouter.of(context).location != '/profile'
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    top: 16.0, left: 16.0),
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: IconButton(
                                      onPressed: () {
                                        if (GoRouter.of(context).location !=
                                            '/profile') {
                                          try {
                                            context.pop();
                                          } finally {
                                            context.go('/');
                                          }
                                        }
                                      },
                                      icon: const Icon(
                                        Icons.arrow_back_rounded,
                                        color: Colors.white,
                                      )),
                                ),
                              )
                            : const SizedBox(),
                        const Spacer(),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 16.0, right: 16.0),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                )),
                          ),
                        )
                      ],
                    ),
                  ]),
                ),
                Expanded(
                  child: ListView(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const SearchWidget(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      } else {
        return Scaffold(
          body: SafeArea(
            child: Stack(children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileInfo2(tag: id),
                  ],
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GoRouter.of(context).location != '/profile'
                      ? Padding(
                          padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                                onPressed: () {
                                  if (GoRouter.of(context).location !=
                                      '/profile') {
                                    try {
                                      GoRouter.of(context).pop();
                                    } finally {
                                      context.go('/');
                                    }
                                  }
                                },
                                icon: const Icon(
                                  Icons.arrow_back_rounded,
                                  color: Colors.white,
                                )),
                          ),
                        )
                      : const SizedBox(),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0, right: 16.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          )),
                    ),
                  )
                ],
              ),
            ]),
          ),
        );
      }
    });
  }
}
