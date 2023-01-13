import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dagda/data/mockupdata/user_mockup.dart';
import 'package:dagda/data/model/user.dart';
import 'package:dagda/screens/profile/profile_design_v2.dart';
import 'package:dagda/widgets/search/search.dart';
import 'package:flutter/gestures.dart';
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
    Uri.parse('https://pre-api.dagda.social/api/users/$id'),
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

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    getUser(widget.id);
    _tabController =
        TabController(length: userCategories.length + 1, vsync: this);
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
                                ProfileInfo2(
                                  user: snapshot.data as User,
                                ),
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
                              ProfileInfo2(
                                user: daviddf,
                              ),
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
                                          borderRadius:
                                              BorderRadius.circular(10)),
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
              );
            },
          ),
        );
      } else {
        return Scaffold(
          body: SafeArea(
            child: FutureBuilder(
              initialData: daviddf,
              future: getUser(widget.id),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return const profilev3();
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return Stack(children: [
                  CustomScrollView(
                    controller: _scrollController,
                    slivers: [
                      SliverToBoxAdapter(
                        child: ProfileInfo2(user: daviddf),
                      ),
                      SliverAppBar(
                        automaticallyImplyLeading: false,
                        backgroundColor: Colors.white,
                        pinned: true,
                        title: TabBar(
                          controller: _tabController,
                          splashBorderRadius: BorderRadius.circular(12),
                          indicatorColor: Colors.black,
                          labelColor: Colors.white,
                          unselectedLabelColor: Colors.black,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorWeight: 2,
                          indicatorPadding:
                              const EdgeInsets.only(left: 10, right: 10),
                          indicator: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black),
                          tabs: [
                            const Tab(text: 'All'),
                            for (var i = 0; i < userCategories.length; i++)
                              Tab(text: userCategories[i].category.name),
                          ],
                        ),
                      ),
                      SliverFillRemaining(
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            for (var i = 0; i < userCategories.length + 1; i++)
                              GridView.builder(
                                controller: _scrollController,
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3),
                                itemCount: 120,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: const EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
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
                                        fit: BoxFit.cover,
                                        image: CachedNetworkImageProvider(
                                            'https://picsum.photos/200/300'),
                                      ),
                                    ),
                                  );
                                },
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GoRouter.of(context).location != '/profile'
                          ? Padding(
                              padding:
                                  const EdgeInsets.only(top: 16.0, left: 16.0),
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
                ]);
              },
            ),
          ),
        );
      }
    });
  }
}

class profilev3 extends StatefulWidget {
  const profilev3({Key? key}) : super(key: key);

  @override
  State<profilev3> createState() => _profilev3State();
}

class _profilev3State extends State<profilev3>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: userCategories.length + 1, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(controller: _scrollController, slivers: [
      SliverAppBar(
        leading: GoRouter.of(context).location != '/profile'
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
                        if (GoRouter.of(context).location != '/profile') {
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
        floating: true,
        snap: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        automaticallyImplyLeading: false,
        pinned: true,
        elevation: 10,
        expandedHeight: 450,
        flexibleSpace: FlexibleSpaceBar(
            background: ProfileInfo2(
              user: daviddf,
            ),
            collapseMode: CollapseMode.parallax,
            stretchModes: const [StretchMode.zoomBackground],
            centerTitle: false,
            title: Text(
              daviddf.name,
              style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(10)),
              child: IconButton(
                  padding: const EdgeInsets.all(4),
                  onPressed: () {},
                  icon: const Icon(
                    size: 24,
                    Icons.more_vert,
                    color: Colors.white,
                  )),
            ),
          ),
        ],
      ),
      SliverAppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        pinned: true,
        surfaceTintColor: Colors.white,
        title: TabBar(
          controller: _tabController,
          splashBorderRadius: BorderRadius.circular(12),
          indicatorColor: Colors.black,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 2,
          indicatorPadding: const EdgeInsets.only(left: 10, right: 10),
          indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(12), color: Colors.black),
          tabs: [
            for (var i = 0; i < userCategories.length + 1; i++)
              Tab(
                text: i == 0 ? 'All' : userCategories[i - 1].category.name,
              )
          ],
        ),
      ),
      SliverFillRemaining(
        fillOverscroll: true,
        child: TabBarView(

          controller: _tabController,
          children: [
            for (var i = 0; i < userCategories.length + 1; i++)
              (ListView.builder(
                  controller: _scrollController,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 60,
                      width: 60,
                      color: Colors.black,
                      padding: EdgeInsets.all(20),
                      child: Text(
                        'Item $index',
                        style: TextStyle(color: Colors.white),
                      ),

                    );
                  },
                  itemCount: 10))
          ],
        ),
      ),
    ]);
  }
}
