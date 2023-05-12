import 'package:anime_catalog_app/providers/anime_get_action_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_adventure_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_anime_detail_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_comedy_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_drama_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_rank_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_romance_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_scifi_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_search_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_sliceoflife_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_sport_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_supernatural.dart';
import 'package:anime_catalog_app/repostories/anime_repostories.dart';
import 'package:anime_catalog_app/repostories/anime_repostories_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'app_constant.dart';

final sl = GetIt.instance;
void setup() {
  //register provider
  sl.registerFactory<AnimeGetActionProvider>(() => AnimeGetActionProvider(sl()));
  sl.registerFactory<AnimeGetAdventureProvider>(() => AnimeGetAdventureProvider(sl()));
  sl.registerFactory<AnimeGetComedyProvider>(() => AnimeGetComedyProvider(sl()));
  sl.registerFactory<AnimeGetDramaProvider>(() => AnimeGetDramaProvider(sl()));
  sl.registerFactory<AnimeGetRankProvider>(() => AnimeGetRankProvider(sl()));
  sl.registerFactory<AnimeGetRomanceProvider>(() => AnimeGetRomanceProvider(sl()));
  sl.registerFactory<AnimeGetSciFiProvider>(() => AnimeGetSciFiProvider(sl()));
  sl.registerFactory<AnimeGetSliceofLifeProvider>(() => AnimeGetSliceofLifeProvider(sl()));
  sl.registerFactory<AnimeGetSportsProvider>(() => AnimeGetSportsProvider(sl()));
  sl.registerFactory<AnimeGetSupernaturalProvider>(() => AnimeGetSupernaturalProvider(sl()));
  sl.registerFactory<AnimeGetAnimeDetailProvider>(() => AnimeGetAnimeDetailProvider(sl()));
  sl.registerFactory<GetSearchProvider>(() => GetSearchProvider(sl()));

  sl.registerLazySingleton<AnimeRepostories>(() => AnimeRepostoriesImpl(sl()));

  sl.registerLazySingleton<Dio>(
    () => Dio(
      BaseOptions(
        baseUrl: AppConstant.baseUrl,
        headers: {'X-RapidAPI-Key': AppConstant.apiKey},
      ),
    ),
  );
}
