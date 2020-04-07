
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fun_flutter_music/utils/text_utils.dart';

class ImageUtils {
  
  static ImageProvider getAssetImage(String name, {String format: 'png'}){
    return AssetImage(getImgPath(name, format: format));
  }

  static String getImgPath(String name, {String format: 'png'}) {
    return 'images/$name.$format';
  }

  static ImageProvider getImageProvider(String imageUrl, {String holderImg: "none"}){
    if (TextUtil.isEmpty(imageUrl)){
      return AssetImage(getImgPath(holderImg));
    }
    return CachedNetworkImageProvider(imageUrl);
  }
}

