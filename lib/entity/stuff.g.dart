// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stuff.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stuff _$StuffFromJson(Map<String, dynamic> json) => Stuff(
      json['description'] as String?,
      nameRu: json['nameRu'] as String?,
      posterUrl: json['posterUrl'] as String?,
      professionText: json['professionText'] as String?,
    );

Map<String, dynamic> _$StuffToJson(Stuff instance) => <String, dynamic>{
      'nameRu': instance.nameRu,
      'posterUrl': instance.posterUrl,
      'professionText': instance.professionText,
      'description': instance.description,
    };
