import 'package:flutter/material.dart';
import 'package:fun_flutter_music/pages/splash/splash_page.dart';
import 'package:fun_flutter_music/provider/play_song_model.dart';
import 'package:fun_flutter_music/provider/search_provider.dart';
import 'package:fun_flutter_music/utils/color_utils.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());
final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => SearchProvider()),
          ChangeNotifierProvider(create: (context) => PlaySongsModel()),
        ],
        child: Consumer<SearchProvider>(builder: (context, model, _) {
          return MaterialApp(
            title: 'fun-music',
            navigatorKey: navigatorKey,
            home: SplashPage(),
            theme: ThemeData(primaryColor: ColorPrimary),
          );
        }));
  }
}
