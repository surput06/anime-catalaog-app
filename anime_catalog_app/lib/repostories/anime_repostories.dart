import 'package:dartz/dartz.dart';
import '../models/anime_model.dart';

abstract class AnimeRepostories {
  Future<Either<String, Anime>> getAnimeRank({int page = 1});
  Future<Either<String, Anime>> getRomance({int page = 1});
}
