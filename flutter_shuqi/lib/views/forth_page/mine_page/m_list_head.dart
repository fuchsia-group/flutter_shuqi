import 'package:flutter/material.dart';
import 'package:flutter_shuqi/common/sq_color.dart';


class MineListHead extends StatefulWidget {
  @override
  _MineListHeadState createState() => _MineListHeadState();
}

class _MineListHeadState extends State<MineListHead> {

  Widget _drawInfo(String value,String name){
    return Expanded(
      child: Container(
        padding: EdgeInsets.only(top:10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(value,style: TextStyle(color: SQColor.darkGray,fontSize: 16),),
            Text(name,style: TextStyle(color: SQColor.gray,fontSize: 10),)
          ],
        ),
      )
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20,right: 20,bottom: 20),
      color: Colors.white,
      child: Column(
        children: <Widget>[
         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: <Widget>[
              InkWell(
                onTap: null,
                child: Image.asset("images/me_feedback.png"),
              )
           ],
         ),
         
          Row(
            children: <Widget>[ 
              InkWell(
                onTap: null,
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Image.asset("images/placeholder_avatar.png")
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  color: SQColor.white,
                  padding: EdgeInsets.only(left: 10),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          child: InkWell(
                            onTap: (){

                            },
                            child: Text("登录/注册",style: TextStyle(color:  SQColor.primary,fontSize: 14),),
                          ),
                      ),

                      Container(
                        // color: SQColor.blue,
                        child: Row(
                          children: <Widget>[
                           _drawInfo("0.0","书豆余额"),
                           _drawInfo("0.0","豆劵（张）"),
                           _drawInfo("2","月票"),
                          ],
                        )
                      ),
                      
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}