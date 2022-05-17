import 'package:json_annotation/json_annotation.dart';

part 'dto_start_page.g.dart';

/// Корневой элемент Json
@JsonSerializable()
class CardDTO {
  @JsonKey(name: 'docs')
  final List<CardDataDTO>? docs;

  CardDTO({this.docs});

  factory CardDTO.fromJson(Map<String, dynamic> json) =>
      _$CardDTOFromJson(json);
}

/// элемент docs:
@JsonSerializable()
class CardDataDTO {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;

  @JsonKey(name: 'name', defaultValue: '')
  final String title;

  @JsonKey(name: 'poster')
  final CardDataImageDTO? picture;

  @JsonKey(name: 'votes')
  final CardDataVotesDTO? voteAverage;

  @JsonKey(name: 'year')
  final String? releaseDate;

  @JsonKey(name: 'description')
  final String? description;

  CardDataDTO({
    required this.id,
    required this.title,
    required this.picture,
    this.voteAverage,
    this.releaseDate,
    this.description,
  });

  factory CardDataDTO.fromJson(Map<String, dynamic> json) =>
      _$CardDataDTOFromJson(json);
}

/// элемент image:
@JsonSerializable()
class CardDataImageDTO {
  @JsonKey(name: 'previewUrl', defaultValue: '')
  final String? previewUrl;

  CardDataImageDTO({
    this.previewUrl,
  });

  factory CardDataImageDTO.fromJson(Map<String, dynamic> json) =>
      _$CardDataImageDTOFromJson(json);
}

@JsonSerializable()
class CardDataVotesDTO {
  @JsonKey(name: 'kp', defaultValue: 0)
  final double? kp;

  CardDataVotesDTO({
    this.kp,
  });

  factory CardDataVotesDTO.fromJson(Map<String, dynamic> json) =>
      _$CardDataVotesDTOFromJson(json);
}