import 'package:flutter/material.dart';

import '../models/anime_model.dart';
import 'img_widget.dart';

class ItemAnime extends Container {
  final AnimeModel anime;
  ItemAnime(this.anime, {super.key});
  @override
  Widget? get child => Stack(
        children: [
          ImgWidget(
            height: 350,
            width: double.infinity,
            imgSrc: anime.image,
            fit: BoxFit.cover,
          ),
          Container(
            height: 350,
            width: double.infinity,
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
                          width: 220,
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
