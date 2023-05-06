import 'package:anime_catalog_app/component/get_romance_widget.dart';
import 'package:anime_catalog_app/models/anime_model.dart';
import 'package:anime_catalog_app/pages/pagination.dart';
import 'package:anime_catalog_app/providers/anime_get_rank_provider%20copy.dart';
import 'package:anime_catalog_app/providers/anime_get_romance_provider.dart';
import 'package:anime_catalog_app/widget/img_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../component/top_anime_widget.dart';
import '../widget/title_Widget.dart';
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
            TitleWidget(
              title: "Romance",
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => Pagination()));
              },
            ),
            const GetRomanceWidget(),
          ],
        ));
  }
}
