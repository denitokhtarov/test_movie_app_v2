// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'youtube_video_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YouTubeVideoID _$YouTubeVideoIDFromJson(Map<String, dynamic> json) =>
    YouTubeVideoID(
      items: (json['items'] as List<dynamic>)
          .map((e) => VideoId.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$YouTubeVideoIDToJson(YouTubeVideoID instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

VideoId _$VideoIdFromJson(Map<String, dynamic> json) => VideoId(
      id: json['id'] == null
          ? null
          : Id.fromJson(json['id'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VideoIdToJson(VideoId instance) => <String, dynamic>{
      'id': instance.id,
    };

Id _$IdFromJson(Map<String, dynamic> json) => Id(
      videoId: json['videoId'] as String?,
    );

Map<String, dynamic> _$IdToJson(Id instance) => <String, dynamic>{
      'videoId': instance.videoId,
    };
