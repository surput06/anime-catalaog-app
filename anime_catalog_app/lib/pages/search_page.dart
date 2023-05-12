import 'package:anime_catalog_app/providers/anime_get_search_provider.dart';
import 'package:anime_catalog_app/widget/item_anime.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'detail_anime.dart';

class SearchPage extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (query.isNotEmpty) {
        context.read<GetSearchProvider>().getSearch(context, query: query);
      }
    });

    return IconButton(
      onPressed: () => close(context, null),
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Consumer<GetSearchProvider>(
      builder: (_, provider, __) {
        if (provider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (provider.anime.isEmpty) {
          return const Center(child: Text("Anime Not Found"));
        }

        if (provider.anime.isNotEmpty) {
          return GridView.builder(
            itemCount: provider.anime.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 30,
              crossAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemBuilder: (BuildContext context, index) {
              final anime = provider.anime[index];
              return ItemAnime(
                anime: anime,
                rank: 12,
                height: 350,
                width: double.infinity,
                sbWidth: 150,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (_) {
                      return DetailAnime(id: anime.id);
                    },
                  ));
                },
              );
            },
          );
        }
        return const Center(
          child: Text("Search Anime"),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text("data");
  }
}
