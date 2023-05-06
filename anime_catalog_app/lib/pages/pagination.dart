import 'package:anime_catalog_app/models/anime_model.dart';
import 'package:anime_catalog_app/providers/anime_get_romance_provider.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

class Pagination extends StatefulWidget {
  const Pagination({Key? key}) : super(key: key);

  @override
  _PaginationState createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  final PagingController<int, Anime> _pagingController = PagingController(
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
        builderDelegate: PagedChildBuilderDelegate<Anime>(
          itemBuilder: (context, anime, index) => Card(),
        ),
        separatorBuilder: (context, index) => Card(),
      ),
    );
  }
}
