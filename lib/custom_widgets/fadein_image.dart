import 'package:flutter/material.dart';
import 'package:movie/helpers/api_helper.dart';
import 'package:transparent_image/transparent_image.dart';

class FadeImage extends StatelessWidget {
  final String path;
  final bool lowQuality;
  final double? width;

  const FadeImage(
    this.path, {
    Key? key,
    this.width,
    required this.lowQuality,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // Bottom Fade Effect
      foregroundDecoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            Colors.black,
          ],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          stops: [0.85, 1],
        ),
      ),

      // Fade-in Effect
      child: FadeInImage.memoryNetwork(
        width: width,
        placeholder: kTransparentImage,
        image: ApiHelper.bannerSearchLink(path, lowQuality: lowQuality),
      ),
    );
  }
}
