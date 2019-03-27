import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shuqi/widgets/404.dart';

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
    {"text": Text("免费"), "icon": Icon(Icons.free_breakfast)},
    {"text": Text("独家"), "icon": Icon(Icons.signal_cellular_4_bar)},
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
          WidgetNotFound(),
          WidgetNotFound(),
          WidgetNotFound(),
          WidgetNotFound()
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
