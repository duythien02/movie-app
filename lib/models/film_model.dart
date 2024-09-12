class FilmModel {
  String id;
  String name;
  String slug;
  String originalName;
  String posterUrl;
  String thumpUrl;
  int year;
  String? type;
  bool? subDocquyen;
  bool? chieurap;
  String? time;
  String? episodeCurrent;
  String? quality;
  String? lang;
  List<Category>? category;
  List<Category>? country;
  String? content;
  List<String>? actor;
  List<String>? director;
  List<Episodes> episodes;

  //constructor
  FilmModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.originalName,
    required this.posterUrl,
    required this.thumpUrl,
    required this.year,
    required this.type,
    required this.subDocquyen,
    required this.chieurap,
    required this.time,
    required this.episodeCurrent,
    required this.quality,
    required this.lang,
    required this.category,
    required this.country,
    required this.content,
    required this.actor,
    required this.director,
    required this.episodes,
  });
  //from json
  factory FilmModel.fromJson(Map<String, dynamic> json, [Episodes? episodes]) {
    return FilmModel(
      id: json["_id"],
      name: json["name"],
      slug: json["slug"],
      originalName: json["origin_name"],
      posterUrl: json["poster_url"],
      thumpUrl: json["thumb_url"],
      year: json["year"],
      type: json["type"],
      subDocquyen: json["sub_docquyen"],
      chieurap: json["chieurap"],
      time: json["time"],
      episodeCurrent: json["episode_current"].toString().contains("Hoàn Tất")
          ? json["episode_current"]
              .toString()
              .replaceFirst("Hoàn Tất", "Trọn bộ")
          : json["episode_current"],
      quality: json["quality"] == "FHD" ? "Full HD" : json["quality"],
      lang: json["lang"],
      category: json["category"] == null
          ? null
          : List<Category>.from(
              json["category"].map((e) => Category.fromJson(e)),
            ),
      country: json["country"] == null
          ? null
          : List<Category>.from(
              json["country"].map((e) => Category.fromJson(e)),
            ),
      content: json["content"],
      actor: json["actor"] == null
          ? null
          : List<String>.from(json["actor"].map((e) => e)),
      director: json["director"] == null
          ? null
          : List<String>.from(json["director"].map((e) => e)),
      episodes: episodes == null ? [] : [episodes],
    );
  }
}

class Category {
  String id;
  String name;
  String slug;

  Category({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: json["name"],
        slug: json["slug"],
      );
}

class Episodes {
  String serverName;
  List<ServerData> serverData;

  Episodes({
    required this.serverName,
    required this.serverData,
  });

  factory Episodes.fromJson(Map<String, dynamic> json) => Episodes(
        serverName: json["server_name"],
        serverData: List<ServerData>.from(
          json["server_data"].map(
            (x) => ServerData.fromJson(x),
          ),
        ),
      );
}

class ServerData {
  String name;
  String slug;
  String fileName;
  String linkEmbed;
  String linkM3u8;

  ServerData({
    required this.name,
    required this.slug,
    required this.fileName,
    required this.linkEmbed,
    required this.linkM3u8,
  });

  factory ServerData.fromJson(Map<String, dynamic> json) => ServerData(
        name: json["name"],
        slug: json["slug"],
        fileName: json["filename"],
        linkEmbed: json["link_embed"],
        linkM3u8: json["link_m3u8"],
      );
}
