import 'package:json_annotation/json_annotation.dart';

part 'similar_movies.g.dart';

@JsonSerializable()
class SimilarMovies {
  final List<SimilarMovie> items;

  SimilarMovies({required this.items});

  factory SimilarMovies.fromJson(Map<String, dynamic> json) =>
      _$SimilarMoviesFromJson(json);
  Map<String, dynamic> toJson() => _$SimilarMoviesToJson(this);
}

@JsonSerializable()
class SimilarMovie {
  final int? filmId;
  final String? nameRu;
  final String? nameEn;
  final String? posterUrl;
  final String? posterUrlPreview;

  SimilarMovie(
      {required this.filmId,
      required this.nameRu,
      required this.nameEn,
      required this.posterUrl,
      required this.posterUrlPreview});

  factory SimilarMovie.fromJson(Map<String, dynamic> json) =>
      _$SimilarMovieFromJson(json);
  Map<String, dynamic> toJson() => _$SimilarMovieToJson(this);
}
