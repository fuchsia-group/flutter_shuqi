



import 'package:flutter/material.dart';
import 'm_list_head.dart';
import 'm_list_row.dart';

class MinePage extends StatefulWidget {
  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {

  static String arrow ="images/arrow_right.png";
  List<Map> listData =[
      {"image":"images/me_wallet.png","title":"钱包","charge":"充值"},
      {"image":"images/me_wallet.png","title":"消费充值记录","arrow":arrow},
      {"image":"images/me_wallet.png","title":"购买的书","arrow":arrow},
      {"image":"images/me_wallet.png","title":"新手会员","arrow":arrow,"point":"point"},
      {"image":"images/me_wallet.png","title":"绑兑换码","arrow":arrow},
      {"image":"images/me_wallet.png","title":"阅读之约","arrow":arrow},
      {"image":"images/me_wallet.png","title":"公益行动","arrow":arrow},
      {"image":"images/me_wallet.png","title":"我的收藏","arrow":arrow},
      {"image":"images/me_wallet.png","title":"打赏记录","arrow":arrow},
      {"image":"images/me_wallet.png","title":"我的书评","arrow":arrow},
      {"image":"images/me_wallet.png","title":"夜间模式","switch":"1"},
      {"image":"images/me_wallet.png","title":"个性换肤","arrow":arrow},
      {"image":"images/me_wallet.png","title":"设置","arrow":arrow},
      {"image":"images/me_wallet.png","title":"意见反馈","arrow":arrow},

  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context,i){
        if (i==0) {
          return MineListHead();
        }
        if (!i.isOdd) {
          return  Container(
            padding: const  EdgeInsets.only(left: 40),
            child: Divider(height: 4,),
          );
        } 
         final index = i ~/ 2;
        //  Key key =ObjectKey(index);
         return MineListRow(index: index,data: listData[index],);   
      
      },
      itemCount: listData.length*2+1,
    );
  }
}

