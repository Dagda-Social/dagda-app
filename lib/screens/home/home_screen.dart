import 'package:cached_network_image/cached_network_image.dart';
import 'package:dagda/widgets/buttons/icon_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: false,
            title: Text(
              AppLocalizations.of(context).appName,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 34,
                  fontFamily: 'Comfortaa'),
            ),
            actions: [
              Container(
                margin: const EdgeInsets.all(6.0),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: IconButton(
                  icon: const Icon(Icons.message_rounded),
                  iconSize: 30,
                  color: Colors.black,
                  onPressed: () {},
                ),
              ),
            ],
          ),
          SliverFillRemaining(
            hasScrollBody: true,
            child: Column(
              children: [
                Expanded(
                  child: Container(
                      margin: const EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 20),
                      child: ListView.builder(
                        itemCount: 10,
                        itemBuilder: ((context, index) => Container(
                              margin: const EdgeInsets.only(bottom: 20.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(right: 20.0),
                                    height: 40,
                                    width: 40,
                                    child: const ClipRRect(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      child: Image(
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        height: 160,
                                        image: CachedNetworkImageProvider(
                                            'https://picsum.photos/200/300'),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'daviddf',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              fontFamily: 'Comfortaa'),
                                        ),
                                        Text(
                                          'Dagda is a social network./n nikapsihdpashdipasdkjfasñkfasd',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 16,
                                              fontFamily: 'Comfortaa'),
                                        ),
                                        
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
