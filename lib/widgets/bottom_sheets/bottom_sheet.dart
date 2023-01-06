import 'package:dagda/widgets/buttons/buttons.dart';
import 'package:dagda/widgets/buttons/filled_button.dart';
import 'package:flutter/material.dart';

Future<dynamic> bottomSheet(BuildContext context, List<Widget> children) {
  return showModalBottomSheet(
      constraints: const BoxConstraints(maxWidth: 648),
      isScrollControlled: true,
      context: context,
      enableDrag: true,
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.4,
            minChildSize: 0.2,
            maxChildSize: 0.8,
            builder: (context, controller) {
              return ListView(controller: controller, children: children);
            });
      });
}

Future<dynamic> bottomSheetFollow(
    BuildContext context, List<Widget> children, String title) {
  return showModalBottomSheet(
      constraints: const BoxConstraints(maxWidth: 648),
      isScrollControlled: true,
      context: context,
      enableDrag: true,
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return DraggableScrollableSheet(
            expand: false,
            initialChildSize: 0.6,
            minChildSize: 0.4,
            maxChildSize: 0.9,
            builder: (context, controller) {
              return Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: CustomScrollView(
                      controller: controller,
                      slivers: [
                        SliverAppBar(
                          foregroundColor: Colors.transparent,
                          backgroundColor: Colors.white,
                          automaticallyImplyLeading: false,
                          pinned: true,
                          elevation: 2,
                          toolbarHeight: 60,
                          centerTitle: false,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(10),
                                bottom: Radius.circular(10)),
                          ),
                          title: Text(
                            title,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SliverFillRemaining(
                            hasScrollBody: true,
                            child: Scrollbar(
                              
                              showTrackOnHover: true,
                              child: ListView.builder(
                                  controller: controller,
                                  itemCount: children.length + 1,
                                  itemBuilder: (context, i) {
                                    if (i == children.length) {
                                      return Container(
                                        height: 10,
                                      );
                                    }
                                    return children[i];
                                  }),
                            ))
                      ],
                    ),
                  ),
                  bottomNavigationBar: Container(
                    decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(20)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          spreadRadius: 0,
                          offset: Offset(0, -5),
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 30, top: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: DagdaOutlinedButton(
                                  title: 'Cancel',
                                  onPressed: () {
                                    Navigator.pop(context);
                                  })),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                              flex: 1,
                              child: DagdaButton(
                                  title: 'Follow',
                                  onPressed: () {
                                    Navigator.pop(context);
                                  })),
                        ],
                      ),
                    ),
                  ));
            });
      });
}
