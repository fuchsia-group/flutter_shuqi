import 'package:flutter/material.dart';
import 'package:flutter_shuqi/common/sq_color.dart';
import 'package:flutter_shuqi/common/screen.dart';

class GuidePage extends StatefulWidget {
  GuidePage({Key key}) : super(key: key);

  @override
  createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(color: SQColor.white),
        preferredSize: Size(Screen.width, 0),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Container(
              constraints: BoxConstraints(minHeight: 410, maxHeight: 410),
              child: Column(
                children: <Widget>[
                  Text("请选择喜欢的类型", style: TextStyle(color: Color(0xff161724))),
                  Text("可多选")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
