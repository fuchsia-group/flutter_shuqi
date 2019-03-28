import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'book_list.dart';
import 'package:flutter_shuqi/common/screen.dart';

class BookshelfPage extends StatefulWidget {
  BookshelfPage({Key key}) : super(key: key);

  @override
  createState() => _BookshelfPageState();
}

class _BookshelfPageState extends State<BookshelfPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            elevation: 0,
            actions: <Widget>[Icon(Icons.search), Icon(Icons.more_horiz)],
            backgroundColor: Colors.blue,
            expandedHeight: 200.0,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.asset("images/bookshelf_bg.png",
                    fit: BoxFit.fitWidth, width: Screen.width)),
            title: Stack(
              children: <Widget>[Text("书棋")],
            ),
            pinned: true,
          ),
          SliverGrid(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            delegate: SliverChildBuilderDelegate((builder, index) {
              return _buildItem(context, books[index]);
            }, childCount: books.length),
          )
        ],
      ),
    );
  }

  Widget _buildItem(context, BookItem book) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        children: <Widget>[Image.asset(book.asset, width: 90, height: 130)],
      ),
    );
  }

  // Widget _buildItem(context, BookItem book) {
  //   var width = (Screen.width - 15 * 2 - 24 * 2) / 3;
  //   return GestureDetector(
  //     onTap: () {},
  //     child: Container(
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: <Widget>[
  //           DecoratedBox(
  //             child: Image.asset(
  //               book.asset,
  //               width: width,
  //               height: width / 0.75,
  //             ),
  //             decoration: BoxDecoration(boxShadow: [
  //               BoxShadow(color: Color(0x22000000), blurRadius: 5)
  //             ]),
  //           ),
  //           SizedBox(height: 10),
  //           Text(book.bookName,
  //               style: TextStyle(fontSize: 14),
  //               maxLines: 1,
  //               overflow: TextOverflow.ellipsis),
  //           SizedBox(height: 25),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
