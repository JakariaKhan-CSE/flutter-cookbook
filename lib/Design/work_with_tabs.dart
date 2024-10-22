import 'package:flutter/material.dart';

class WorkWithTabs extends StatelessWidget {
  const WorkWithTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
// app bar a ai icon gulo show korbe tab akare
        appBar:  AppBar(
          bottom: TabBar(tabs: [
            Tab(icon: Icon(Icons.directions_car),),
            Tab(icon: Icon(Icons.directions_transit)),
            Tab(icon: Icon(Icons.directions_bike))
          ]),
          title: const Text('Tab Demo'),centerTitle: true,
        ),
        // children order (assendending/descending same as tabbar
        body: TabBarView(children: [
          Icon(Icons.directions_car),
          Icon(Icons.directions_transit),
          Icon(Icons.directions_bike),

        ],
        ),
      ),
    );
  }
}
