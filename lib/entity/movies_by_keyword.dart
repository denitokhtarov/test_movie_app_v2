import 'package:json_annotation/json_annotation.dart';

part 'movies_by_keyword.g.dart';

@JsonSerializable()
class MoviesByKeyword {
  final List<MovieByKeyword> films;
  MoviesByKeyword({required this.films});

  factory MoviesByKeyword.fromJson(Map<String, dynamic> json) =>
      _$MoviesByKeywordFromJson(json);
  Map<String, dynamic> toJson() => _$MoviesByKeywordToJson(this);
}

@JsonSerializable()
class MovieByKeyword {
  final int? filmId;
  final String? year;
  final String? nameRu;
  final String? description;
  final String? posterUrl;
  final String? posterUrlPreview;
  MovieByKeyword({
    required this.filmId,
    required this.year,
    required this.nameRu,
    required this.description,
    required this.posterUrl,
    required this.posterUrlPreview,
  });

  factory MovieByKeyword.fromJson(Map<String, dynamic> json) =>
      _$MovieByKeywordFromJson(json);
  Map<String, dynamic> toJson() => _$MovieByKeywordToJson(this);
}
