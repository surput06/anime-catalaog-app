import 'package:anime_catalog_app/component/genre_tag_widget.dart';
import 'package:anime_catalog_app/component/get_romance_widget.dart';
import 'package:anime_catalog_app/pages/pagination.dart';
import 'package:anime_catalog_app/pages/search_page.dart';
import 'package:flutter/material.dart';

import '../component/top_anime_widget.dart';
import '../widget/title_widget.dart';

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
              onPressed: () {
                showSearch(context: context, delegate: SearchPage());
              },
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
            const SliverAppBar(
              backgroundColor: Colors.transparent,
              title: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    'Genre Tag'),
              ),
            ),
            const GenreTagWidget(),
            TitleWidget(
              title: "Romance",
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Pagination(type: typeAnime.romance)));
              },
            ),
            const GetRomanceWidget(),
          ],
        ));
  }
}
