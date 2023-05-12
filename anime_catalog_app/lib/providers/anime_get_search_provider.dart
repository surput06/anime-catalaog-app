import 'package:flutter/material.dart';

import '../models/anime_model.dart';
import '../repostories/anime_repostories.dart';

class GetSearchProvider with ChangeNotifier {
  final AnimeRepostories _animeRepostories;

  GetSearchProvider(this._animeRepostories);

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  final List<AnimeModel> _anime = [];
  List<AnimeModel> get anime => _anime;

  void getSearch(BuildContext context, {required String query}) async {
    _isLoading = true;
    notifyListeners();

    final result = await _animeRepostories.getSearch(query: query);

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
        return;
      },
    );
  }
}
