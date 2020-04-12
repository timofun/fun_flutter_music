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
    var height = ScreenUtil().setHeight(374 / 1011 * (1011 - 20));
    print(height);
    return Container(
        height: height,
        decoration: new BoxDecoration(
          color: ColorBackground,
        ),
        padding: EdgeInsets.only(bottom: 20, left: 10, right: 10),
        child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(ScreenUtil().setWidth(10))),
                child: FadeInImage.assetNetwork(
                  placeholder: "http://www.xyfdcw.com.cn/userfiles/image/20200225/250949238ea3e3a7ec8112.jpg",
                  image: _banners[index].pic,
                  fit: BoxFit.cover,
                )
              );
            },
            autoplay: true,
            itemCount: _banners.length > 0 ? _banners.length : 3,
            pagination: new SwiperPagination(
                builder: DotSwiperPaginationBuilder(
                    color: ColorDefault, size: 6.0, activeSize: 8.0))));
  }
}
