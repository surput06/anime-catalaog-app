import 'package:anime_catalog_app/models/anime_model.dart';
import 'package:anime_catalog_app/providers/anime_get_action_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_adventure_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_comedy_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_drama_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_romance_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_scifi_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_sliceoflife_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_sport_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_supernatural.dart';
import 'package:anime_catalog_app/widget/item_anime.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';

enum typeAnime { rankanime, romance, action, adventure, comedy, drama, scifi, sliceoflife, sport, supernatural }

class Pagination extends StatefulWidget {
  const Pagination({Key? key, required this.type}) : super(key: key);

  final typeAnime type;

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
      switch (widget.type) {
        case typeAnime.romance:
          context.read<AnimeGetRomanceProvider>().getRomancePaging(
                context,
                page: pageKey,
                pagingController: _pagingController,
              );
          break;
        case typeAnime.action:
          context.read<AnimeGetActionProvider>().getActionPaging(
                context,
                page: pageKey,
                pagingController: _pagingController,
              );
          break;
        case typeAnime.adventure:
          context.read<AnimeGetAdventureProvider>().getAdventurePaging(
                context,
                page: pageKey,
                pagingController: _pagingController,
              );
          break;
        case typeAnime.comedy:
          context.read<AnimeGetComedyProvider>().getComedyPaging(
                context,
                page: pageKey,
                pagingController: _pagingController,
              );
          break;
        case typeAnime.drama:
          context.read<AnimeGetDramaProvider>().getDramaPaging(
                context,
                page: pageKey,
                pagingController: _pagingController,
              );
          break;
        case typeAnime.scifi:
          context.read<AnimeGetSciFiProvider>().getSciFiPaging(
                context,
                page: pageKey,
                pagingController: _pagingController,
              );
          break;
        case typeAnime.sliceoflife:
          context.read<AnimeGetSliceofLifeProvider>().getSliceofLifePaging(
                context,
                page: pageKey,
                pagingController: _pagingController,
              );
          break;
        case typeAnime.sport:
          context.read<AnimeGetSportsProvider>().getSportsPaging(
                context,
                page: pageKey,
                pagingController: _pagingController,
              );
          break;
        case typeAnime.supernatural:
          context.read<AnimeGetSupernaturalProvider>().getSupernaturalPaging(
                context,
                page: pageKey,
                pagingController: _pagingController,
              );
          break;
        default:
      }
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
          title: Builder(builder: (_) {
            switch (widget.type) {
              case typeAnime.romance:
                return const Text("Romance");
              case typeAnime.action:
                return const Text("Action");
              case typeAnime.adventure:
                return const Text("Adventure");
              case typeAnime.comedy:
                return const Text("Comedy");
              case typeAnime.drama:
                return const Text("Drama");
              case typeAnime.scifi:
                return const Text("Sci-Fi");
              case typeAnime.sliceoflife:
                return const Text("Slice Of Life");
              case typeAnime.sport:
                return const Text("Sports");
              case typeAnime.supernatural:
                return const Text("Super Natural");
              default:
                return const Text("");
            }
          }),
        ),
        body: PagedGridView(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 30,
            crossAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          pagingController: _pagingController,
          builderDelegate: PagedChildBuilderDelegate<AnimeModel>(
              itemBuilder: (context, anime, index) => ItemAnime(
                    anime: anime,
                    height: 350,
                    width: double.infinity,
                    sbWidth: 150,
                    rank: 12,
                  )),
        ));
  }
}
