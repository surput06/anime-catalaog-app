import 'package:anime_catalog_app/injector.dart';
import 'package:anime_catalog_app/pages/dashboard.dart';

import 'package:anime_catalog_app/providers/anime_get_action_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_adventure_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_comedy_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_drama_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_rank_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_romance_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_scifi_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_search_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_sliceoflife_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_sport_provider.dart';
import 'package:anime_catalog_app/providers/anime_get_supernatural.dart';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  setup();

  runApp(const MyApp());
  FlutterNativeSplash.remove();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => sl<AnimeGetRomanceProvider>()),
        ChangeNotifierProvider(create: (_) => sl<AnimeGetRankProvider>()),
        ChangeNotifierProvider(create: (_) => sl<AnimeGetActionProvider>()),
        ChangeNotifierProvider(create: (_) => sl<AnimeGetComedyProvider>()),
        ChangeNotifierProvider(create: (_) => sl<AnimeGetDramaProvider>()),
        ChangeNotifierProvider(create: (_) => sl<AnimeGetSciFiProvider>()),
        ChangeNotifierProvider(create: (_) => sl<AnimeGetSliceofLifeProvider>()),
        ChangeNotifierProvider(create: (_) => sl<AnimeGetSportsProvider>()),
        ChangeNotifierProvider(create: (_) => sl<AnimeGetSupernaturalProvider>()),
        ChangeNotifierProvider(create: (_) => sl<AnimeGetAdventureProvider>()),
        ChangeNotifierProvider(create: (_) => sl<GetSearchProvider>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Anime Catalog App',
        theme: ThemeData(scaffoldBackgroundColor: const Color(0XFF0C1921), appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent, foregroundColor: Colors.white, shadowColor: Colors.transparent)),
        home: const Dashboard(),
      ),
    );
  }
}
