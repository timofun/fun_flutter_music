import 'package:flutter/material.dart';
import 'package:fun_flutter_music/utils/color_utils.dart';
class RankPage extends StatefulWidget {
  @override
  _rankPageState createState() => _rankPageState();
}

class _rankPageState extends State<RankPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
            '排行榜',
            style: TextStyle(fontSize: 17, color: Color999),
          ),
          centerTitle: true
      ),
      body: Container(
        decoration: BoxDecoration(
            color: ColorBackground
        ),
        child: ListView(
          children: <Widget>[
            Text('hahahha')
          ],
        ),
      ),
    );
  }
}
