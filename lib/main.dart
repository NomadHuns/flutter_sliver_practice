import 'package:flutter/material.dart';
import 'package:sliverapp/ad.dart';
import 'package:sliverapp/diary.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
            snap: true,
            floating: true,
            title: Text("Sliver AppBar"),
            pinned: false,
            // 앱바 고정 유무
            expandedHeight: 250,
            // 앱바 확장 크기
            flexibleSpace: Container(
              child: Center(
                child: Text("FlexivleSpace", style: TextStyle(fontSize: 50)),
              ),
            ),
          ),
          SliverAppBar(
            title: Text("Sliver AppBar"),
            pinned: true, // 앱바 고정 유무
            expandedHeight: 50, // 앱바 확장 크기
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 20,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 100,
                    color: Colors.blueAccent,
                    child: Center(
                      child: Text('Item $index'),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 100,
            delegate: SliverChildBuilderDelegate(
              childCount: 100,
              (context, index) {
                if (index % 4 == 0 && index != 0) {
                  return Ad((index / 4).toInt());
                } else {
                  return Diary(index);
                }
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
