import 'package:anime_catalog_app/models/anime_model.dart';
import 'package:anime_catalog_app/providers/anime_get_romance_provider.dart';
import 'package:anime_catalog_app/widget/item_anime.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class Pagination extends StatefulWidget {
  const Pagination({Key? key}) : super(key: key);

  @override
  PaginationState createState() => PaginationState();
}

class PaginationState extends State<Pagination> {
  final PagingController<int, AnimeModel> _pagingController = PagingController(
    firstPageKey: 1,
  );

  @override
  void initState() {
    _pagingController.addPageRequestListener((pageKey) {
      context.read<AnimeGetRomanceProvider>().getRomancePaging(
            context,
            page: pageKey,
            pagingController: _pagingController,
          );
    });
    super.initState();
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Romance'),
      ),
      body: PagedListView.separated(
        pagingController: _pagingController,
        builderDelegate: PagedChildBuilderDelegate<AnimeModel>(
          itemBuilder: (context, anime, index) => ItemAnime(anime: anime, height: 330, width: double.infinity, sbWidth: 220),
        ),
        separatorBuilder: (context, index) => Card(),
      ),
    );
  }
}
