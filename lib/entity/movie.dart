import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class PopularMovies {
  final List<Movie> items;

  PopularMovies({required this.items});

  factory PopularMovies.fromJson(Map<String, dynamic> json) =>
      _$PopularMoviesFromJson(json);
  Map<String, dynamic> toJson() => _$PopularMoviesToJson(this);
}

@JsonSerializable()
class Movie {
  final int? kinopoiskId;
  final String? nameRu;
  final String? nameOriginal;
  final List<Country>? countries;
  final List<Genre>? genres;
  final double? ratingKinopoisk;
  final double? ratingImdb;
  final int? year;
  final String? type;
  final String? posterUrl;
  final String? posterUrlPreview;
  final String? coverUrl;
  final String? logoUrl;
  final String? description;
  final String? ratingAgeLimits;

  Movie({
    required this.kinopoiskId,
    required this.nameRu,
    required this.nameOriginal,
    required this.countries,
    required this.genres,
    required this.ratingKinopoisk,
    required this.ratingImdb,
    required this.year,
    required this.type,
    required this.posterUrl,
    required this.posterUrlPreview,
    required this.coverUrl,
    required this.logoUrl,
    required this.description,
    required this.ratingAgeLimits,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);
}

@JsonSerializable()
class Country {
  final String? country;

  Country({required this.country});

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);
  Map<String, dynamic> toJson() => _$CountryToJson(this);
}

@JsonSerializable()
class Genre {
  final String? genre;

  Genre({required this.genre});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);
  Map<String, dynamic> toJson() => _$GenreToJson(this);
}
