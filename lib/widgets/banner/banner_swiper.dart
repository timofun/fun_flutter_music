import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fun_flutter_music/network/api_request_url.dart';
import 'package:fun_flutter_music/network/request_manager.dart';
import 'package:fun_flutter_music/utils/color_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return AspectRatio(
        aspectRatio: (1011 - (ScreenUtil().setWidth(15) * 2)) / 375,
        child: Container(
            decoration: new BoxDecoration(
              color: ColorBackground,
            ),
            padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(15))),
                      child: _banners.length > 0 ? Image.network(_banners[index].pic, fit: BoxFit.fill,)
                          : Image.asset('images/banner_default.png', fit: BoxFit.fill,)
                  );
                },
                autoplay: true,
                itemCount: _banners.length > 0 ? _banners.length : 3,
                pagination: new SwiperPagination(
                    builder: DotSwiperPaginationBuilder(
                        color: ColorDefault, size: 6.0, activeSize: 8.0)))));
  }
}
