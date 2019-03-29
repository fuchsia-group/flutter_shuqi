import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_shuqi/common/screen.dart';
import 'package:flutter_shuqi/views/common/page_control.dart';


class AloneHomeBanner extends StatefulWidget {
  @override
  _AloneHomeBannerState createState() => _AloneHomeBannerState();
}

class _AloneHomeBannerState extends State<AloneHomeBanner> {

  int currentPage = 0;

 static List<Map> bannerData = [
    {"url":"http://img-tailor.11222.cn/pm/book/operate/2019010321241999.jpg"},
    {"url":"http://img-tailor.11222.cn/pm/book/operate/2019010320432795.jpg"}
  ];

  List<Widget> _getBannerWidget(){
    return bannerData.map((map){
      return Container(
        width: Screen.width,
        margin: EdgeInsets.symmetric(horizontal: 0),
        child: Image.network(map["url"]),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
      CarouselSlider(
      viewportFraction: 1.0,
      autoPlayInterval: Duration(seconds: 3),
      items: _getBannerWidget(),
      onPageChanged: (int i){
        setState(() {
          currentPage = i;
        });
      },
      autoPlay: true,
    ),
      PageControl(
        currentPage: currentPage,
        pageCount: 2,
      ),
      ],
    );
    // return 
  }
}