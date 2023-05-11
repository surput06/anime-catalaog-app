import 'package:carousel_slider/carousel_slider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/anime_get_rank_provider copy.dart';
import '../widget/item_anime.dart';

class TopAnimeWidget extends StatefulWidget {
  const TopAnimeWidget({Key? key}) : super(key: key);

  @override
  TopAnimeWidgetState createState() => TopAnimeWidgetState();
}

class TopAnimeWidgetState extends State<TopAnimeWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AnimeGetRankProvider>().getAnimeRank(context);

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

              return ItemAnime(
                anime: anime,
                height: 350,
                rank: 20,
                width: double.infinity,
                sbWidth: 220,
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
        return const Center(
          child: Text(style: TextStyle(color: Colors.white), 'Not found'),
        );
      },
    ));
  }
}
