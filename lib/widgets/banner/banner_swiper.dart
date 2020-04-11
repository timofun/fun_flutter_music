import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fun_flutter_music/network/api_request_url.dart';
import 'package:fun_flutter_music/network/request_manager.dart';
import 'package:fun_flutter_music/utils/color_utils.dart';

import 'model/Banner_model.dart';
import 'model/banners.dart';

class BannerSwiper extends StatefulWidget {
  @override
  _BannerState createState() => _BannerState();
}

class _BannerState extends State<BannerSwiper> {
  List<Banners> _banners = [];

  @override
  void initState() {
    // TODO: implement initState
    _getBanner();
    super.initState();
  }

  void _getBanner() {
    RequestManager.getInstance().get(BANNER, params: {'type': 2}).then((val) {
      setState(() {
        _banners = BannerModel.fromJsonMap(val.data).banners;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: new BoxDecoration(
          color: ColorBackground,
        ),
        height: 130,
        child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                _banners.length > 0
                    ? _banners[index].pic
                    : 'http://www.xyfdcw.com.cn/userfiles/image/20200225/250949238ea3e3a7ec8112.jpg',
                fit: BoxFit.fill,
              );
            },
            autoplay: true,
            itemCount: _banners.length > 0 ? _banners.length : 3,
            viewportFraction: 0.8,
            scale: 0.9,
            pagination: new SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                    color: ColorDefault, size: 6.0, activeSize: 8.0))));
  }
}
