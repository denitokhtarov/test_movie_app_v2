// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'similar_movies.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SimilarMovies _$SimilarMoviesFromJson(Map<String, dynamic> json) =>
    SimilarMovies(
      items: (json['items'] as List<dynamic>)
          .map((e) => SimilarMovie.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SimilarMoviesToJson(SimilarMovies instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

SimilarMovie _$SimilarMovieFromJson(Map<String, dynamic> json) => SimilarMovie(
      filmId: (json['filmId'] as num?)?.toInt(),
      nameRu: json['nameRu'] as String?,
      nameEn: json['nameEn'] as String?,
      posterUrl: json['posterUrl'] as String?,
      posterUrlPreview: json['posterUrlPreview'] as String?,
    );

Map<String, dynamic> _$SimilarMovieToJson(SimilarMovie instance) =>
    <String, dynamic>{
      'filmId': instance.filmId,
      'nameRu': instance.nameRu,
      'nameEn': instance.nameEn,
      'posterUrl': instance.posterUrl,
      'posterUrlPreview': instance.posterUrlPreview,
    };
