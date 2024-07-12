import 'package:json_annotation/json_annotation.dart';

part 'youtube_video_id.g.dart';

@JsonSerializable()
class YouTubeVideoID {
  List<VideoId> items;

  YouTubeVideoID({required this.items});

  factory YouTubeVideoID.fromJson(Map<String, dynamic> json) =>
      _$YouTubeVideoIDFromJson(json);
  Map<String, dynamic> toJson() => _$YouTubeVideoIDToJson(this);
}

@JsonSerializable()
class VideoId {
  final Id? id;

  VideoId({required this.id});

  factory VideoId.fromJson(Map<String, dynamic> json) =>
      _$VideoIdFromJson(json);
  Map<String, dynamic> toJson() => _$VideoIdToJson(this);
}

@JsonSerializable()
class Id {
  final String? videoId;
  Id({required this.videoId});

  factory Id.fromJson(Map<String, dynamic> json) => _$IdFromJson(json);
  Map<String, dynamic> toJson() => _$IdToJson(this);
}
