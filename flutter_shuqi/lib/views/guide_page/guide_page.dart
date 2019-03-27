import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_shuqi/common/sq_color.dart';
import 'package:flutter_shuqi/common/screen.dart';
import 'package:flutter_shuqi/views/first_page/home.dart';

class GuidePage extends StatefulWidget {
  GuidePage({Key key}) : super(key: key);

  @override
  createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  final _selected = new Set<int>();
  bool isEnable = false;
  final List _items = [
    {
      "title": "现言",
      "startColor": Color(0xffb782dd),
      "endColor": Color(0xffdd87de)
    },
    {
      "title": "古言",
      "startColor": Color(0xff86bfbc),
      "endColor": Color(0xffc7d5b0)
    },
    {
      "title": "幻言",
      "startColor": Color(0xfff686ab),
      "endColor": Color(0xfffda8d9)
    },
    {
      "title": "都市",
      "startColor": Color(0xfffd7f7f),
      "endColor": Color(0xfffcb7a1)
    },
    {
      "title": "玄幻",
      "startColor": Color(0xff8294d5),
      "endColor": Color(0xffb5e5e6)
    },
    {
      "title": "灵异",
      "startColor": Color(0xff7688bf),
      "endColor": Color(0xff88cfca)
    },
    {
      "title": "校园",
      "startColor": Color(0xfffda176),
      "endColor": Color(0xfffed584)
    },
    {
      "title": "出版",
      "startColor": Color(0xff8c8f94),
      "endColor": Color(0xffb5b9c0)
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          child: Container(color: SQColor.white),
          preferredSize: Size(Screen.width, 0),
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[_buildTop(), _buildBody(), _buildBottom()],
          )),
        ));
  }

  Widget _buildTop() {
    return Container(
      constraints: BoxConstraints.tight(Size.fromHeight(130.0)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text("请选择喜欢的类型",
              style: TextStyle(
                  color: Color(0xff161724),
                  fontSize: 20,
                  fontStyle: FontStyle.normal)),
          Text("可多选")
        ],
      ),
    );
  }

  Widget _buildBody() {
    // return CustomScrollView(
    //   primary: false,
    //   slivers: <Widget>[
    //     SliverPadding(
    //       padding: const EdgeInsets.all(20.0),
    //       sliver: SliverGrid.count(
    //         crossAxisSpacing: 10.0,
    //         crossAxisCount: 2,
    //         children: _items.map((item) => _buildItem(item)).toList(),
    //       ),
    //     )
    //   ],
    // );
    // return GridView.count(
    //   primary: false,
    //   padding: const EdgeInsets.all(10),
    //   crossAxisSpacing: 10.0,
    //   crossAxisCount: 2,
    //   children: _items.map((item) => _buildItem(item)).toList(),
    // );
    return Container(
      padding: EdgeInsets.only(bottom: 10),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[_buildItem(0), _buildItem(1)],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[_buildItem(2), _buildItem(3)],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[_buildItem(4), _buildItem(5)],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[_buildItem(6), _buildItem(7)],
          )
        ],
      ),
    );
  }

  Widget _buildItem(int index) {
    final alreadySelected = _selected.contains(index);

    var item = _items[index];
    Color startColor = item["startColor"];
    Color endColor = item["endColor"];

    return GestureDetector(
      onTap: () {
        setState(() {
          if (alreadySelected) {
            _selected.remove(index);
          } else {
            _selected.add(index);
          }
        });
      },
      child: Stack(
        alignment: Alignment.centerRight,
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              width: 140,
              height: 70,
              padding: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [startColor, endColor]),
                  borderRadius: BorderRadius.circular(5.0), // 3像素圆角
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffe5d3f0),
                        offset: Offset(3.0, 5.0),
                        blurRadius: 4.0)
                  ]),
              child: Text(
                item["title"],
                style: TextStyle(color: Colors.white, fontSize: 18),
              )),
          Positioned(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check_circle,
                  color: alreadySelected ? Colors.green : Colors.grey[300]),
            ),
            right: -10.0,
          ),
        ],
      ),
    );
  }

  Widget _buildBottom() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              if (isEnable) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HemoPage();
                }));
              }
            },
            child: Container(
              padding: EdgeInsets.only(top: 7, bottom: 7, left: 17, right: 17),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                border: Border.all(
                    width: 1, color: isEnable ? Colors.black : Colors.grey),
              ),
              child: Text("下一步",
                  style:
                      TextStyle(color: isEnable ? Colors.black : Colors.grey)),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.check_circle,
                  color: isEnable ? Colors.green : Colors.grey[300],
                ),
                onPressed: () {
                  setState(() {
                    isEnable = !isEnable;
                  });
                },
                iconSize: 14,
                alignment: Alignment.centerRight,
                padding: EdgeInsets.all(0),
              ),
              Text(
                " 同意",
                style: TextStyle(fontSize: 12),
              ),
              Text("《阿里文学用户服务协议》",
                  style: TextStyle(fontSize: 12, color: Colors.green)),
              Text("《隐私权政策》",
                  style: TextStyle(fontSize: 12, color: Colors.green)),
            ],
          ),
        ],
      ),
    );
  }
}
