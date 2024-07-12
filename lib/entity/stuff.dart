import 'package:json_annotation/json_annotation.dart';

part 'stuff.g.dart';

@JsonSerializable()
class Stuff {
  final String? nameRu;
  final String? posterUrl;
  final String? professionText;
  final String? description;
  Stuff(
    this.description, {
    required this.nameRu,
    required this.posterUrl,
    required this.professionText,
  });

  factory Stuff.fromJson(Map<String, dynamic> json) => _$StuffFromJson(json);

  Map<String, dynamic> toJson() => _$StuffToJson(this);
}
