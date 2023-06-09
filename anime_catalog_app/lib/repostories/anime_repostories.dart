import 'package:anime_catalog_app/models/anime_detail_model.dart';
import 'package:dartz/dartz.dart';
import '../models/anime_model.dart';

abstract class AnimeRepostories {
  Future<Either<String, Anime>> getAnimeRank({int page = 1});
  Future<Either<String, Anime>> getRomance({int page = 1});
  Future<Either<String, Anime>> getAction({int page = 1});
  Future<Either<String, Anime>> getAdventure({int page = 1});
  Future<Either<String, Anime>> getSciFi({int page = 1});
  Future<Either<String, Anime>> getComedy({int page = 1});
  Future<Either<String, Anime>> getSliceofLife({int page = 1});
  Future<Either<String, Anime>> getDrama({int page = 1});
  Future<Either<String, Anime>> getSupernatural({int page = 1});
  Future<Either<String, Anime>> getSports({int page = 1});
  Future<Either<String, AnimeDetail>> getAnimeDetail({required String id});
  Future<Either<String, Anime>> getSearch({String query});
}
