import 'dart:convert';

import '../models/anime_model.dart';
import 'anime_repostories.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

class AnimeRepostoriesImpl implements AnimeRepostories {
  final Dio _dio;

  AnimeRepostoriesImpl(this._dio);

  @override
  Future<Either<String, Anime>> getRomance({int page = 1}) async {
    try {
      final result = await _dio.get('/anime', queryParameters: {
        'genres': 'Romance',
        'page': page,
        'size': '10',
      });
      if (result.statusCode == 200 && result.data != null) {
        final model = animeFromJson(jsonEncode(result.data));
        return Right(model);
      }
      throw 'Tidak dapat mendapat data';
    } on DioError catch (e) {
      if (e.response != null) {
        return Left(e.response.toString());
      }
      return const Left('another error on get romance');
    }
  }
}
