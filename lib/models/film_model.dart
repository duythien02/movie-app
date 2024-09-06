class FilmModel {
  String id;
  String name;
  String slug;
  String originalName;
  String posterUrl;
  String thumpUrl;
  int year;
  bool? subDocquyen;
  bool? chieurap;
  String? time;
  String? episodeCurrent;
  String? quality;
  String? lang;
  List<Category>? category;
  List<Category>? country;

  //constructor
  FilmModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.originalName,
    required this.posterUrl,
    required this.thumpUrl,
    required this.year,
    required this.subDocquyen,
    required this.chieurap,
    required this.time,
    required this.episodeCurrent,
    required this.quality,
    required this.lang,
    required this.category,
    required this.country,
  });
  //from json
  factory FilmModel.fromJson(Map<String, dynamic> json) => FilmModel(
        id: json["_id"],
        name: json["name"],
        slug: json["slug"],
        originalName: json["origin_name"],
        posterUrl: json["poster_url"],
        thumpUrl: json["thumb_url"],
        year: json["year"],
        subDocquyen: json["sub_docquyen"],
        chieurap: json["chieurap"],
        time: json["time"],
        episodeCurrent: json["episode_current"],
        quality: json["quality"],
        lang: json["lang"],
        category: json["category"] == null
            ? null
            : List<Category>.from(
                json["category"].map((i) => Category.fromJson(i)),
              ),
        country: json["country"] == null
            ? null
            : List<Category>.from(
                json["country"].map((i) => Category.fromJson(i)),
              ),
      );
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
