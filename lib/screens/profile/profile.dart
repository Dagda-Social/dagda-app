import 'dart:convert';

import 'package:dagda/data/mockupdata/user_mockup.dart';
import 'package:dagda/data/model/user.dart';
import 'package:dagda/screens/profile/profile_design_v2.dart';
import 'package:dagda/widgets/search/search.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:http/http.dart' as http;

class Profile extends StatefulWidget {
  final String id;
  const Profile({Key? key, required this.id}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

Future<User> getUser(String id) async {
  final response = await http.get(
    Uri.parse('https://dagda-api.herokuapp.com/api/users/$id'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  } else {
    return daviddf;
  }
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    getUser(widget.id);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (buildContext, constraints) {
      if (constraints.maxWidth > 800) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: FutureBuilder(
            future: getUser(widget.id),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return SafeArea(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Stack(children: [
                          Positioned(
                            child: ListView(
                              children: [
                                ProfileInfo2(user: snapshot.data as User),
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
                                            color:
                                                Colors.white.withOpacity(0.1),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: IconButton(
                                            onPressed: () {
                                              if (GoRouter.of(context)
                                                      .location !=
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
                                padding: const EdgeInsets.only(
                                    top: 16.0, right: 16.0),
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
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        );
      } else {
        return Scaffold(
          body: SafeArea(
            child: FutureBuilder(
              future: getUser(widget.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Stack(children: [
                    SingleChildScrollView(
                      child: Column(
                        children: [
                          ProfileInfo2(user: snapshot.data as User),
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
                  ]);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        );
      }
    });
  }
}
