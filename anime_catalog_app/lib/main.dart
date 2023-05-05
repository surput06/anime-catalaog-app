import 'package:anime_catalog_app/app_constant.dart';
import 'package:anime_catalog_app/pages/dashboard.dart';
import 'package:anime_catalog_app/pages/detail_anime.dart';
import 'package:anime_catalog_app/providers/anime_get_rank_provider%20copy.dart';
import 'package:anime_catalog_app/providers/anime_get_romance_provider.dart';
import 'package:anime_catalog_app/repostories/anime_repostories.dart';
import 'package:anime_catalog_app/repostories/anime_repostories_impl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dio/dio.dart';

void main() {
  final dioOptions = BaseOptions(baseUrl: AppConstant.baseUrl, headers: {'X-RapidAPI-Key': AppConstant.apiKey});
  final Dio dio = Dio(dioOptions);
  final AnimeRepostories animeRepostories = AnimeRepostoriesImpl(dio);

  runApp(MyApp(animeRepostories: animeRepostories));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.animeRepostories});
  final AnimeRepostories animeRepostories;
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AnimeGetRomanceProvider(animeRepostories)),
        ChangeNotifierProvider(create: (_) => AnimeGetRankProvider(animeRepostories)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Anime Catalog App',
        theme: ThemeData(scaffoldBackgroundColor: const Color(0XFF0C1921), appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, foregroundColor: Colors.white, shadowColor: Colors.transparent)),
        home: const DetailAnime(),
      ),
    );
  }
}
