import 'package:flutter/material.dart';
import 'package:flutter_shuqi/common/sq_color.dart';



class PageControl extends StatefulWidget {
   final int pageCount;
  final int currentPage;
   Color currentColor;
  Color defaultColor;
  double radius;
  double horizontal ;
  PageControl({Key key, this.pageCount, this.currentPage}) :this.horizontal=16,this.radius=6,this.currentColor=SQColor.primary,this.defaultColor=SQColor.gray, super(key: key);
  @override
  _PageControlState createState() => _PageControlState();
}

class _PageControlState extends State<PageControl> {

  BoxDecoration _getDecorationInIndex(int index){
      if (index ==widget.currentPage) {
        return BoxDecoration(
            color: widget.currentColor,
            border: Border.all(color: widget.currentColor),
            borderRadius: BorderRadius.circular(widget.radius/2)
          );
      }else{
       return  BoxDecoration(
            color: widget.defaultColor,
            border: Border.all(color: widget.defaultColor),
            borderRadius: BorderRadius.circular(widget.radius/2)
          );
      }
  }

  List<Widget> _drawPage(){
    List<Widget> list=List();
    for (var i = 0; i < widget.pageCount; i++) {
        Widget item =Container(
          padding: EdgeInsets.symmetric(horizontal: widget.horizontal/2),
          child: Container(
          width: widget.radius,
          height: widget.radius,
          decoration:_getDecorationInIndex(i),
        )
         ) ;
        list.add(item);
    }
      return list;

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.center,
        height: 20,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _drawPage(),
        ),
    );
  }
}