import 'package:flutter/material.dart';

import '../pages/pagination.dart';
import '../widget/genre_item_widget.dart';

class GenreTagWidget extends StatefulWidget {
  const GenreTagWidget({Key? key}) : super(key: key);

  @override
  GenreTagWidgetState createState() => GenreTagWidgetState();
}

class GenreTagWidgetState extends State<GenreTagWidget> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsetsDirectional.symmetric(horizontal: 10),
        color: Colors.white10,
        height: 60,
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            GenreItemWidget(
              title: ("Romance"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Pagination(type: typeAnime.romance)));
              },
            ),
            GenreItemWidget(
              title: ("Action"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Pagination(type: typeAnime.action)));
              },
            ),
            GenreItemWidget(
              title: ("Adventure"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Pagination(type: typeAnime.adventure)));
              },
            ),
            GenreItemWidget(
              title: ("Comedy"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Pagination(type: typeAnime.comedy)));
              },
            ),
            GenreItemWidget(
              title: ("Drama"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Pagination(type: typeAnime.drama)));
              },
            ),
            GenreItemWidget(
              title: ("Sci-Fi"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Pagination(type: typeAnime.scifi)));
              },
            ),
            GenreItemWidget(
              title: ("Slice of Life"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Pagination(type: typeAnime.sliceoflife)));
              },
            ),
            GenreItemWidget(
              title: ("Sports"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Pagination(type: typeAnime.sport)));
              },
            ),
            GenreItemWidget(
              title: ("Supernatural"),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const Pagination(type: typeAnime.supernatural)));
              },
            ),
          ],
        ),
      ),
    );
  }
}
