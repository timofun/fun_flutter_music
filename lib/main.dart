import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:fun_flutter_music/utils/color_utils.dart';
import 'file:///E:/Project/fun_flutter_music/lib/components/load_image.dart';
import 'package:fun_flutter_music/widgets/bottom_navigation.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'fun-music',
      home: BottomNavigation(),
      theme: ThemeData(primaryColor: ColorPrimary),
    );
  }
}
