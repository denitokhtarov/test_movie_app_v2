// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_by_keyword.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesByKeyword _$MoviesByKeywordFromJson(Map<String, dynamic> json) =>
    MoviesByKeyword(
      films: (json['films'] as List<dynamic>)
          .map((e) => MovieByKeyword.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MoviesByKeywordToJson(MoviesByKeyword instance) =>
    <String, dynamic>{
      'films': instance.films,
    };

MovieByKeyword _$MovieByKeywordFromJson(Map<String, dynamic> json) =>
    MovieByKeyword(
      filmId: (json['filmId'] as num?)?.toInt(),
      year: json['year'] as String?,
      nameRu: json['nameRu'] as String?,
      description: json['description'] as String?,
      posterUrl: json['posterUrl'] as String?,
      posterUrlPreview: json['posterUrlPreview'] as String?,
    );

Map<String, dynamic> _$MovieByKeywordToJson(MovieByKeyword instance) =>
    <String, dynamic>{
      'filmId': instance.filmId,
      'year': instance.year,
      'nameRu': instance.nameRu,
      'description': instance.description,
      'posterUrl': instance.posterUrl,
      'posterUrlPreview': instance.posterUrlPreview,
    };
