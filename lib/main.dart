import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:fun_flutter_music/routers/router.dart';
import 'package:fun_flutter_music/utils/application.dart';
import 'package:fun_flutter_music/utils/color_utils.dart';
import 'package:fun_flutter_music/widgets/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'fun-music',
      home: HomePage(),
      theme: ThemeData(primaryColor: ColorPrimary),
    );
  }
}
