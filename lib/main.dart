import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fun_flutter_music/widgets/load_image.dart';

void main() => runApp(MaterialApp(home: BottomNavBar()));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> with SingleTickerProviderStateMixin{
  TabController tabController;

  List colors = [Colors.blue, Colors.pink, Colors.orange, Colors.blue, Colors.pink];

  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(vsync: this, length: 5)
      ..addListener(() {
        setState(() {
          currentIndex = tabController.index;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: 0,
          height: 50.0,
          items: <Widget>[
            LoadAssetImage("icon_music", width: 30.0, height: 30.0),
            LoadAssetImage("icon_music", width: 30.0, height: 30.0),
            LoadAssetImage("icon_music", width: 30.0, height: 30.0),
            LoadAssetImage("icon_music", width: 30.0, height: 30.0),
            LoadAssetImage("icon_music", width: 30.0, height: 30.0),
          ],
          color: Colors.grey,
          buttonBackgroundColor: Colors.red,
          backgroundColor: colors[currentIndex],
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 500),
          onTap: (index) {
            setState(() {
              currentIndex = index;
            });
            tabController.animateTo(index,
                duration: Duration(milliseconds: 300), curve: Curves.ease);
          },
        ),
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
            Container(
              color: colors[currentIndex],
            ),
            Container(
              color: colors[currentIndex],
            ),
            Container(
              color: colors[currentIndex],
            ),
            Container(
              color: colors[currentIndex],
            ),
            Container(
              color: colors[currentIndex],
            ),
          ],
        ));
  }
}
