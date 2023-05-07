import 'package:anime_catalog_app/providers/anime_get_supernatural.dart';
import 'package:anime_catalog_app/widget/img_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/anime_get_romance_provider.dart';

class GetSupernaturalWidget extends StatefulWidget {
  const GetSupernaturalWidget({Key? key}) : super(key: key);

  @override
  _GetSupernaturalWidgetState createState() => _GetSupernaturalWidgetState();
}

class _GetSupernaturalWidgetState extends State<GetSupernaturalWidget> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<AnimeGetSupernaturalProvider>().getSupernatural(context);

      super.initState();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: Consumer<AnimeGetSupernaturalProvider>(
          builder: (_, provider, __) {
            if (provider.isLoading) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 16.0),
                decoration: BoxDecoration(color: Colors.black26, borderRadius: BorderRadius.circular(12.0)),
              );
            }

            if (provider.anime.isNotEmpty) {
              return ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  final anime = provider.anime[index];
                  return ImgWidget(
                    fit: BoxFit.cover,
                    imgSrc: anime.image,
                    height: 200,
                    width: 120,

                    // onTap: () {
                    //   Navigator.push(context, MaterialPageRoute(
                    //     builder: (_) {
                    //       return MovieDetailPage(id: provider.movies[index].id);
                    //     },
                    //   ));
                    // },
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(
                  width: 8.0,
                ),
                itemCount: provider.anime.length,
              );
            }

            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Center(
                child: Text(style: TextStyle(color: Colors.white), 'Not found'),
              ),
            );
          },
        ),
      ),
    );
  }
}
