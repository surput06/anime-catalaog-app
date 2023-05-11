import 'package:anime_catalog_app/models/anime_model.dart';
import 'package:anime_catalog_app/repostories/anime_repostories.dart';
import 'package:flutter/material.dart';

class AnimeGetAnimeDetailProvider with ChangeNotifier {
  final AnimeRepostories _animeRepostories;

  AnimeGetAnimeDetailProvider(this._animeRepostories);

  Anime? _anime;
  Anime? get anime => _anime;

  void getDetail(BuildContext context, {required int id}) async {
    _anime = null;
    notifyListeners();
    final result = await _animeRepostories.getAnimeDetail(id: id);
    result.fold(
      (messageError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(messageError)),
        );
        _anime = null;
        notifyListeners();
        return;
      },
      (response) {
        _anime = response;
        notifyListeners();
        return;
      },
    );
  }
}
