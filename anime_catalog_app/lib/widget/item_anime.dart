import 'package:flutter/material.dart';
import '../models/anime_model.dart';
import 'img_widget.dart';

class ItemAnime extends Container {
  final AnimeModel anime;
  final double height;
  final double width;
  final double sbWidth;
  ItemAnime({required this.anime, required this.height, required this.width, required this.sbWidth, super.key});
  @override
  Widget? get child => Stack(
        children: [
          ImgWidget(
            height: height,
            width: width,
            imgSrc: anime.image,
            fit: BoxFit.cover,
          ),
          Container(
            height: height,
            width: width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black54, Colors.black38, Colors.black54],
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: Container(
              decoration: BoxDecoration(
                  gradient: const LinearGradient(colors: [
                    Color(0xFFB493D7),
                    Color(0xFF8B82C1),
                    Color(0xFF8FA4DB),
                  ]),
                  borderRadius: BorderRadius.circular(10)),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Center(child: Text(style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20), "#${anime.ranking.toString()}")),
              ),
            ),
          ),
          Positioned(
              bottom: 25,
              left: 15,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 20,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(colors: [
                          Color(0xFFB493D7),
                          Color(0xFF8B82C1),
                          Color(0xFF8FA4DB),
                        ]),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Center(child: Text(style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), anime.type)),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(2)),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: SizedBox(
                          width: sbWidth,
                          child: Text(
                            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            anime.title,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(2)),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          style: const TextStyle(color: Colors.white),
                          "${anime.genres[0]},${anime.genres[1]}",
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ],
      );
}
