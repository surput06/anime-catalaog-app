import 'dart:convert';

AnimeDetail animeDetailFromJson(String str) => AnimeDetail.fromJson(json.decode(str));

String animeDetailToJson(AnimeDetail data) => json.encode(data.toJson());

class AnimeDetail {
  String id;
  String title;
  List<String> alternativeTitles;
  int ranking;
  List<String> genres;
  int episodes;
  bool hasEpisode;
  bool hasRanking;
  String image;
  String link;
  String status;
  String synopsis;
  String thumb;
  String type;

  AnimeDetail({
    required this.id,
    required this.title,
    required this.alternativeTitles,
    required this.ranking,
    required this.genres,
    required this.episodes,
    required this.hasEpisode,
    required this.hasRanking,
    required this.image,
    required this.link,
    required this.status,
    required this.synopsis,
    required this.thumb,
    required this.type,
  });

  factory AnimeDetail.fromJson(Map<String, dynamic> json) => AnimeDetail(
        id: json["_id"],
        title: json["title"],
        alternativeTitles: List<String>.from(json["alternativeTitles"].map((x) => x)),
        ranking: json["ranking"],
        genres: List<String>.from(json["genres"].map((x) => x)),
        episodes: json["episodes"],
        hasEpisode: json["hasEpisode"],
        hasRanking: json["hasRanking"],
        image: json["image"],
        link: json["link"],
        status: json["status"],
        synopsis: json["synopsis"],
        thumb: json["thumb"],
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "alternativeTitles": List<dynamic>.from(alternativeTitles.map((x) => x)),
        "ranking": ranking,
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "episodes": episodes,
        "hasEpisode": hasEpisode,
        "hasRanking": hasRanking,
        "image": image,
        "link": link,
        "status": status,
        "synopsis": synopsis,
        "thumb": thumb,
        "type": type,
      };
}
