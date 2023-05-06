import 'package:anime_catalog_app/models/anime_model.dart';
import 'package:anime_catalog_app/providers/anime_get_rank_provider%20copy.dart';
import 'package:anime_catalog_app/providers/anime_get_romance_provider.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<AnimeGetRankProvider>().getRomance(context);
    return Scaffold(
        appBar: AppBar(
          title: const Padding(
            padding: EdgeInsets.only(left: 8),
            child: Text(
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                'Anime Catalog App'),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.search, size: 30.0),
              ),
            ),
          ],
        ),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              backgroundColor: Colors.transparent,
              title: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    'Top-10 Anime'),
              ),
            ),
            const WidgetAnimeRank(),
            SliverAppBar(
              backgroundColor: Colors.transparent,
              title: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    'Romance'),
              ),
              actions: [
                TextButton(
                    onPressed: () {},
                    child: const Padding(
                      padding: EdgeInsets.only(right: 8),
                      child: Text(
                          style: TextStyle(
                            color: Color(0xFF8B82C1),
                          ),
                          "See All"),
                    ))
              ],
            ),
          ],
        ));
  }
}

class WidgetAnimeRank extends StatefulWidget {
  const WidgetAnimeRank({Key? key}) : super(key: key);

  @override
  WidgetAnimeRankState createState() => WidgetAnimeRankState();
}

class WidgetAnimeRankState extends State<WidgetAnimeRank> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AnimeGetRankProvider>().getRomance(context);

      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: Consumer<AnimeGetRankProvider>(
      builder: (_, provider, __) {
        if (provider.isLoading) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white70,
            ),
            height: 350,
            width: double.infinity,
          );
        }
        if (provider.anime.isNotEmpty) {
          return CarouselSlider.builder(
            itemCount: provider.anime.length,
            itemBuilder: (_, index, __) {
              final anime = provider.anime[index];

              return ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Image.network(
                      anime.image,
                      height: 350,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        child: Icon(Icons.broken_image_rounded),
                      ),
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
                ),
              );
            },
            options: CarouselOptions(
              height: 350.0,
              viewportFraction: 0.6,
              reverse: false,
              autoPlay: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
          );
        }
        return const Center(child: Text("not found"));
      },
    ));
  }
}
