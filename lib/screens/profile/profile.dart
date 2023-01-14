import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dagda/data/mockupdata/user_mockup.dart';
import 'package:dagda/data/model/user.dart';
import 'package:dagda/screens/profile/profile_design_v2.dart';
import 'package:dagda/widgets/search/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
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
                        child: ProfilePage(
                          user: snapshot.data as User,
                        ),
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
                      child: ProfilePage(user: snapshot.data as User),
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
                  return ProfilePage(user: snapshot.data as User);
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return ProfilePage(user: snapshot.data as User);
              },
            ),
          ),
        );
      }
    });
  }
}

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key, required this.user}) : super(key: key);
  User user;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late ScrollController _scrollController;
  bool fixedScroll = false;
  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    _tabController =
        TabController(length: userCategories.length + 1, vsync: this);
    _tabController.addListener(_smoothScrollToTop);
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  _scrollListener() {
    if (fixedScroll) {
      _scrollController.jumpTo(0);
    }
  }

  _smoothScrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(microseconds: 300),
      curve: Curves.ease,
    );

    setState(() {
      fixedScroll = _tabController.index == -1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      controller: _scrollController,
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            leading: GoRouter.of(context).location != '/profile'
                ? Padding(
                    padding: const EdgeInsets.only(top: 16.0, left: 16.0),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
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
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                var top = constraints.biggest.height;
                return FlexibleSpaceBar(
                    background: ProfileInfo2(
                      user: widget.user,
                    ),
                    collapseMode: CollapseMode.pin,
                    centerTitle: false,
                    title: AnimatedOpacity(
                      duration: Duration(milliseconds: 100),
                      opacity: top <= 100 ? 1 : 0,
                      child: Text(
                        daviddf.name,
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ));
              },
            ),
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
              isScrollable: true,
              controller: _tabController,
              splashBorderRadius: BorderRadius.circular(12),
              indicatorColor: Colors.black,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: TextStyle(fontSize: 20),
              labelPadding: EdgeInsets.only(left: 40, right: 40),
              indicator: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(12)),
              tabs: [
                for (var i = 0; i < userCategories.length + 1; i++)
                  Tab(
                    text: i == 0 ? 'All' : userCategories[i - 1].category.name,
                  )
              ],
            ),
          ),
        ];
      },
      body: TabBarView(
        controller: _tabController,
        children: [
          for (var i = 0; i < userCategories.length + 1; i++)
            Container(
                child: (GridView.custom(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverWovenGridDelegate.count(
                pattern: [
                  const WovenGridTile(1),
                  const WovenGridTile(5 / 7,
                      crossAxisRatio: 0.9,
                      alignment: AlignmentDirectional.centerEnd),
                ],
                crossAxisCount: 2,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              childrenDelegate: SliverChildBuilderDelegate(
                childCount: 40,
                (BuildContext context, int index) {
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
                      child: Image(
                        width: index % 2 == 0 ? 120 : 100,
                        height: index % 2 == 0 ? 100 : 120,
                        fit: BoxFit.cover,
                        image: const CachedNetworkImageProvider(
                            'https://picsum.photos/200/300'),
                      ),
                    ),
                  );
                },
              ),
            )))
        ],
      ),
    );
  }
}
