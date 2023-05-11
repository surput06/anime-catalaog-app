import 'package:anime_catalog_app/injector.dart';
import 'package:anime_catalog_app/providers/anime_get_anime_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailAnime extends StatelessWidget {
  const DetailAnime({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => sl<AnimeGetAnimeDetailProvider>()..getDetail(context, id: id),
      builder: (_, __) => Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Consumer<AnimeGetAnimeDetailProvider>(builder: (_, provider, __) {
            final anime = provider.anime;

            return Column(
              children: [
                Stack(
                  children: [
                    SizedBox(width: double.infinity, height: 350, child: Image.network(fit: BoxFit.fill, anime != null ? anime.image : "https://i.stack.imgur.com/WeyM8.jpg")),
                    Container(
                      height: 350,
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.center,
                          end: Alignment.bottomCenter,
                          colors: [Colors.transparent, Color(0XFF0C1921)],
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 1,
                        left: 20,
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
                                child: Center(child: Text(style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold), anime != null ? anime.type : "")),
                              ),
                            ),
                            const Padding(padding: EdgeInsets.all(2)),
                            Row(
                              children: [
                                Container(
                                  width: 350,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 5),
                                    child: Text(
                                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                                      anime != null ? anime.title : "",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Padding(padding: EdgeInsets.all(2)),
                          ],
                        )),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        style: const TextStyle(color: Colors.white, fontSize: 20),
                        anime != null ? anime.genres.join(",") : "",
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              style: const TextStyle(
                                color: Color.fromARGB(202, 255, 255, 255),
                                fontSize: 18,
                              ),
                              "Total Episode : ${anime != null ? anime.episodes : ""}"),
                          Text(
                              style: const TextStyle(
                                color: Color.fromARGB(202, 255, 255, 255),
                                fontSize: 18,
                              ),
                              anime != null ? anime.status : ""),
                          Text(
                              style: const TextStyle(
                                color: Color.fromARGB(202, 255, 255, 255),
                                fontSize: 18,
                              ),
                              "Rank : #${anime != null ? anime.ranking : ""}"),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.0),
                        child: Text(style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20, fontWeight: FontWeight.bold), "Synopsis"),
                      ),
                      Text(
                          style: const TextStyle(
                            color: Color.fromARGB(202, 255, 255, 255),
                            fontSize: 18,
                          ),
                          anime != null ? anime.synopsis : ""),
                    ],
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
