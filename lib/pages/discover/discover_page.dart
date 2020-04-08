import 'package:flutter/material.dart';
import 'package:fun_flutter_music/components/banner_swiper.dart';

class DiscoverPage extends StatefulWidget {
  @override
  _DiscoverPageState createState() => _DiscoverPageState();
}

class _DiscoverPageState extends State<DiscoverPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BannerSwiper(),
    );
  }
}
