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

  @override
  Future<Either<String, Anime>> getAnimeRank({int page = 1}) async {
    try {
      final result = await _dio.get('/anime', queryParameters: {
        'genres': '',
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
      return const Left('another error on getAnimeRank');
    }
  }

  @override
  Future<Either<String, Anime>> getAction({int page = 1}) async {
    try {
      final result = await _dio.get('/anime', queryParameters: {
        'genres': 'Action',
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
      return const Left('another error on get Action ');
    }
  }

  @override
  Future<Either<String, Anime>> getAdventure({int page = 1}) async {
    try {
      final result = await _dio.get('/anime', queryParameters: {
        'genres': 'Adventure',
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
      return const Left('another error on get Adventure');
    }
  }

  @override
  Future<Either<String, Anime>> getSciFi({int page = 1}) async {
    try {
      final result = await _dio.get('/anime', queryParameters: {
        'genres': 'Sci-Fi',
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
      return const Left('another error on get Sci-Fi');
    }
  }

  @override
  Future<Either<String, Anime>> getComedy({int page = 1}) async {
    try {
      final result = await _dio.get('/anime', queryParameters: {
        'genres': 'Comedy',
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
      return const Left('another error on get Comedy');
    }
  }

  @override
  Future<Either<String, Anime>> getSliceofLife({int page = 1}) async {
    try {
      final result = await _dio.get('/anime', queryParameters: {
        'genres': 'Slice of Life',
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
      return const Left('another error on get Slice of Life');
    }
  }

  @override
  Future<Either<String, Anime>> getDrama({int page = 1}) async {
    try {
      final result = await _dio.get('/anime', queryParameters: {
        'genres': 'Drama',
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
      return const Left('another error on get Drama');
    }
  }

  @override
  Future<Either<String, Anime>> getSupernatural({int page = 1}) async {
    try {
      final result = await _dio.get('/anime', queryParameters: {
        'genres': 'Supernatural',
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
      return const Left('another error on get Supernatural');
    }
  }

  @override
  Future<Either<String, Anime>> getSports({int page = 1}) async {
    try {
      final result = await _dio.get('/anime', queryParameters: {
        'genres': 'Sports',
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
      return const Left('another error on get Sports');
    }
  }
}
