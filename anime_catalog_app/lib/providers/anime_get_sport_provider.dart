import 'package:anime_catalog_app/models/anime_model.dart';
import 'package:anime_catalog_app/repostories/anime_repostories.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AnimeGetSportsProvider with ChangeNotifier {
  final AnimeRepostories _animeRepostories;

  AnimeGetSportsProvider(this._animeRepostories);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<AnimeModel> _anime = [];
  List<AnimeModel> get anime => _anime;

  void getSports(BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    final result = await _animeRepostories.getSports();

    result.fold(
      (errorMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
        _isLoading = false;
        notifyListeners();
        return;
      },
      (response) {
        _anime.clear();
        _anime.addAll(response.data);

        _isLoading = false;
        notifyListeners();
        return null;
      },
    );
  }

  void getSportsPaging(
    BuildContext context, {
    required int page,
    required PagingController pagingController,
  }) async {
    final result = await _animeRepostories.getSports(page: page);

    result.fold(
      (errorMessage) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );

        return;
      },
      (response) {
        if (response.data.length < 10) {
          pagingController.appendLastPage(response.data);
        } else {
          pagingController.appendPage(response.data, page + 1);
        }
        return;
      },
    );
  }
}
