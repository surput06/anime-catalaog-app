import 'package:anime_catalog_app/injector.dart';
import 'package:anime_catalog_app/providers/anime_get_anime_detail_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailAnime extends StatelessWidget {
  const DetailAnime({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sl<AnimeGetAnimeDetailProvider>(),
      builder: (_, __) => Scaffold(),
    );
  }
}

// Scaffold(
//         extendBodyBehindAppBar: true,
//         appBar: AppBar(),
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               Stack(
//                 children: [
//                   SizedBox(width: double.infinity, height: 350, child: Image.network(fit: BoxFit.fill, 'https://cdn.myanimelist.net/images/anime/12/18897.jpg')),
//                   Container(
//                     height: 350,
//                     width: double.infinity,
//                     decoration: const BoxDecoration(
//                       gradient: LinearGradient(
//                         begin: Alignment.center,
//                         end: Alignment.bottomCenter,
//                         colors: [Colors.transparent, Color(0XFF0C1921)],
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                       bottom: 1,
//                       left: 20,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             height: 20,
//                             decoration: BoxDecoration(
//                                 gradient: const LinearGradient(colors: [
//                                   Color(0xFFB493D7),
//                                   Color(0xFF8B82C1),
//                                   Color(0xFF8FA4DB),
//                                 ]),
//                                 borderRadius: BorderRadius.circular(10)),
//                             child: const Padding(
//                               padding: EdgeInsets.symmetric(horizontal: 5),
//                               child: Center(child: Text(style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold), "TV")),
//                             ),
//                           ),
//                           const Padding(padding: EdgeInsets.all(2)),
//                           Row(
//                             children: const [
//                               Padding(
//                                 padding: EdgeInsets.only(left: 5),
//                                 child: Text(
//                                   style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
//                                   "Saiilor Moon",
//                                 ),
//                               ),
//                             ],
//                           ),
//                           const Padding(padding: EdgeInsets.all(2)),
//                           Row(
//                             children: const [
//                               Padding(
//                                 padding: EdgeInsets.only(left: 5),
//                                 child: Text(
//                                   style: TextStyle(color: Colors.white, fontSize: 20),
//                                   "Alternate Name",
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       )),
//                 ],
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(25.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       style: TextStyle(color: Colors.white, fontSize: 20),
//                       "[Action,romance,shoujou]",
//                     ),
//                     Padding(padding: EdgeInsets.all(10)),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                             style: TextStyle(
//                               color: Color.fromARGB(202, 255, 255, 255),
//                               fontSize: 18,
//                             ),
//                             "Total Episode : 1"),
//                         Text(
//                             style: TextStyle(
//                               color: Color.fromARGB(202, 255, 255, 255),
//                               fontSize: 18,
//                             ),
//                             "Status : Aired"),
//                         Text(
//                             style: TextStyle(
//                               color: Color.fromARGB(202, 255, 255, 255),
//                               fontSize: 18,
//                             ),
//                             "Rank : #1"),
//                       ],
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 20.0),
//                       child: Text(style: TextStyle(color: Color(0xFFFFFFFF), fontSize: 20, fontWeight: FontWeight.bold), "Synopsis"),
//                     ),
//                     Text(
//                         style: TextStyle(
//                           color: Color.fromARGB(202, 255, 255, 255),
//                           fontSize: 18,
//                         ),
//                         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
