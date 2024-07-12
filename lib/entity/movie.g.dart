// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularMovies _$PopularMoviesFromJson(Map<String, dynamic> json) =>
    PopularMovies(
      items: (json['items'] as List<dynamic>)
          .map((e) => Movie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PopularMoviesToJson(PopularMovies instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

Movie _$MovieFromJson(Map<String, dynamic> json) => Movie(
      kinopoiskId: (json['kinopoiskId'] as num?)?.toInt(),
      nameRu: json['nameRu'] as String?,
      nameOriginal: json['nameOriginal'] as String?,
      countries: (json['countries'] as List<dynamic>?)
          ?.map((e) => Country.fromJson(e as Map<String, dynamic>))
          .toList(),
      genres: (json['genres'] as List<dynamic>?)
          ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
          .toList(),
      ratingKinopoisk: (json['ratingKinopoisk'] as num?)?.toDouble(),
      ratingImdb: (json['ratingImdb'] as num?)?.toDouble(),
      year: (json['year'] as num?)?.toInt(),
      type: json['type'] as String?,
      posterUrl: json['posterUrl'] as String?,
      posterUrlPreview: json['posterUrlPreview'] as String?,
      coverUrl: json['coverUrl'] as String?,
      logoUrl: json['logoUrl'] as String?,
      description: json['description'] as String?,
      ratingAgeLimits: json['ratingAgeLimits'] as String?,
    );

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'kinopoiskId': instance.kinopoiskId,
      'nameRu': instance.nameRu,
      'nameOriginal': instance.nameOriginal,
      'countries': instance.countries,
      'genres': instance.genres,
      'ratingKinopoisk': instance.ratingKinopoisk,
      'ratingImdb': instance.ratingImdb,
      'year': instance.year,
      'type': instance.type,
      'posterUrl': instance.posterUrl,
      'posterUrlPreview': instance.posterUrlPreview,
      'coverUrl': instance.coverUrl,
      'logoUrl': instance.logoUrl,
      'description': instance.description,
      'ratingAgeLimits': instance.ratingAgeLimits,
    };

Country _$CountryFromJson(Map<String, dynamic> json) => Country(
      country: json['country'] as String?,
    );

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'country': instance.country,
    };

Genre _$GenreFromJson(Map<String, dynamic> json) => Genre(
      genre: json['genre'] as String?,
    );

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
      'genre': instance.genre,
    };
