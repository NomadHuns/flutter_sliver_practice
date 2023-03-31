import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Sliver AppBar"),
            pinned: true, // 앱바 고정 유무
            expandedHeight: 250, // 앱바 확장 크기
          ),
          SliverAppBar(
            title: Text("Sliver AppBar"),
            pinned: false, // 앱바 고정 유무
            expandedHeight: 250, // 앱바 확장 크기
          ),
          SliverFixedExtentList(
            itemExtent: 100,
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.lightBlue[100 * (index % 9)],
                  child: Text("List Item $index"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  SliverList buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return Container(
            height: 100,
            alignment: Alignment.center,
            color: Colors.lightBlue[100 * (index % 9)],
            child: Text("List Item $index"),
          );
        },
      ),
    );
  }
}
