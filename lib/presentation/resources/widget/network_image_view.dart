import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class NetworkImageView extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final String? errorFile;
  final BoxFit? fit;
  const NetworkImageView({super.key, required this.url, this.width, this.height, this.errorFile, this.fit});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(imageUrl: url ,width: width,height: height,fit: fit,memCacheHeight: 400, placeholder: (context,url) => const Center(child: CircularProgressIndicator()),
      errorWidget: (context,url,error) => Image.asset(errorFile ?? "assets/images/img_null.png",fit: fit,),
    );
  }
}
