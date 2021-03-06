import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shuqi/widgets/404.dart';
import 'package:flutter_shuqi/views/forth_page/mine_page/mine.dart';
import 'package:flutter_shuqi/views/forth_page/bookshelf/bookshelf_page.dart';
import 'package:flutter_shuqi/views/forth_page/bookshelf/sliver_box.dart';
import 'package:flutter_shuqi/views/second_page/book_city.dart';
import 'package:flutter_shuqi/views/third_page/alone_home/alone_home.dart';

class HemoPage extends StatefulWidget {
  @override
  HemoPageState createState() {
    return HemoPageState();
  }
}

class HemoPageState extends State<HemoPage> {
  static List tabs = [
    {"text": Text("书架"), "icon": Icon(Icons.book)},
    {"text": Text("书城"), "icon": Icon(Icons.bookmark)},
    {"text": Text("独家"), "icon": Icon(Icons.free_breakfast)},
    {"text": Text("我的"), "icon": Icon(Icons.signal_cellular_4_bar)},
  ];

  List<BottomNavigationBarItem> myTabs = [];

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < tabs.length; i++) {
      myTabs.add(BottomNavigationBarItem(
        title: tabs[i]['text'],
        icon: tabs[i]['icon'],
      ));
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          BookshelfPage(),
          BookCity(),
          AloneHome(),
          MinePage()
        ],
        index: _selectedIndex,
      ),
      // IOS效果
      // bottomNavigationBar: CupertinoTabBar(
      //   backgroundColor: Colors.white,
      //   activeColor: SQColor.primary,
      //   items: myTabs,
      //   currentIndex: _selectedIndex,
      //   onTap: _onItemTapped,
      // ),
      bottomNavigationBar: Theme(
        data: ThemeData(
            // 去掉点击水波纹
            brightness: Theme.of(context).brightness,
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent),
        child: BottomNavigationBar(
          items: myTabs,
          currentIndex: _selectedIndex,
          fixedColor: Colors.teal[900],
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
