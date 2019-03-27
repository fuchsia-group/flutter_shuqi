import 'package:flutter/material.dart';
import 'package:flutter_shuqi/common/sq_color.dart';
import 'package:flutter/cupertino.dart';

class MineListRow extends StatefulWidget {

  final int index;
  final Map data;
  const MineListRow({Key key, this.index, this.data}) : super(key: key);

  @override
  _MineListRowState createState() => _MineListRowState();
}

class _MineListRowState extends State<MineListRow> {
  bool _bSwitch =true; 
      Widget _drawRowTail(){
        String temp;
        temp = widget.data["charge"];
        if (temp != null) {
          return Container(
            width: 50,
            height: 20,
            child: RaisedButton(
            padding:EdgeInsets.only(left: 10,right: 10),
            color: SQColor.primary,
            textColor: SQColor.white,
            child: Text(temp,style: TextStyle(fontSize: 12),),
            onPressed: (){

            },
          )
          );
        }
        temp = widget.data["arrow"];
        if (temp !=null) {
          return Image.asset(temp);
        }
        temp =widget.data["switch"];
        if (temp !=null) {
          
          return InkWell(
            child: Container(
            constraints: BoxConstraints(maxHeight: 20),
            child: CupertinoSwitch(value: _bSwitch, onChanged: (bool value) {
              print("$value");
              setState(() {
                _bSwitch =value; 
              });
               
            },
            ),
          ),
          onTap: (){
            setState(() {
              _bSwitch = !_bSwitch;
            });
          },
          );
        }


        return  Text("");
      }
  Widget _drawRedPoint(){
String temp;
        temp = widget.data["point"];
if (temp !=null) {
  return Container(
    padding: EdgeInsets.only(left: 10),
    child: ClipRRect(
              borderRadius: BorderRadius.circular(2.0),
              child: Container(
                color: SQColor.red,
                width: 4,
                height: 4,
                child: Text(""),
              ),
            ),
  );  
}
return Text("");
  }

   Widget _drawRow(int index){
    return Container(
      height: 45,
      // color: SQColor.primary,
      padding: EdgeInsets.only(left: 10,right: 20),
     child: InkWell(
       onTap: null,
      
       child:Container(
         child: Row(
        children: <Widget>[
          Container(
            width: 20,
            child: Image.asset(widget.data["image"]),
          ),
          Container(
            padding: EdgeInsets.only(left: 10),
             child:Text(widget.data["title"]),
          ),
          _drawRedPoint(),
          Expanded(
            child: Container(
                alignment: AlignmentDirectional.centerEnd,
                // color: SQColor.primary,
                child: _drawRowTail(),
            ),
          )
      
        ],
     ) ,
       )
       
       
       
      // child: 
      ),
      
    );
  }
  @override
  Widget build(BuildContext context) {
    return  _drawRow(widget.index);
  }
}