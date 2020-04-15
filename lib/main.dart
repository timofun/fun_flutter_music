import 'package:flutter/material.dart';
import 'package:fun_flutter_music/provider/search_provider.dart';
import 'package:fun_flutter_music/utils/color_utils.dart';
import 'package:fun_flutter_music/widgets/home_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SearchProvider()),
        ],
        child: Consumer<SearchProvider>(builder: (context, counter, _) {
          return MaterialApp(
            title: 'fun-music',
            home: HomePage(),
            theme: ThemeData(primaryColor: ColorPrimary),
          );
        }));
  }
}
