import 'package:anime_catalog_app/models/anime_model.dart';
import 'package:anime_catalog_app/pages/pagination.dart';
import 'package:anime_catalog_app/providers/anime_get_rank_provider%20copy.dart';
import 'package:anime_catalog_app/providers/anime_get_romance_provider.dart';
import 'package:anime_catalog_app/widget/img_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widget/item_anime.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            const TopAnimeWidget(),
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
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Pagination()));
                    },
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

              return ItemAnime(anime);
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
