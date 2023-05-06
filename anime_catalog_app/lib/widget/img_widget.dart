import 'package:flutter/material.dart';

class ImgWidget extends StatelessWidget {
  const ImgWidget({
    Key? key,
    required this.height,
    required this.width,
    required this.imgSrc,
    required this.fit,
  }) : super(key: key);

  final String imgSrc;
  final double height;
  final double width;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    return Image.network(
      imgSrc,
      height: height,
      width: width,
      fit: fit,
      errorBuilder: (context, error, stackTrace) => Container(
        child: Icon(Icons.broken_image_rounded),
      ),
    );
  }
}
