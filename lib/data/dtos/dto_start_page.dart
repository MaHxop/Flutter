import 'package:json_annotation/json_annotation.dart';

part 'dto_start_page.g.dart';

/// Корневой элемент Json
@JsonSerializable()
class DocsCardDTO {
  @JsonKey(name: 'docs')
  final List<DocsCardDataDTO>? docs;

  DocsCardDTO({this.docs});

  factory DocsCardDTO.fromJson(Map<String, dynamic> json) =>
      _$DocsCardDTOFromJson(json);
}

/// элемент docs:
@JsonSerializable()
class DocsCardDataDTO {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;

  @JsonKey(name: 'name', defaultValue: '')
  final String title;

  @JsonKey(name: 'poster')
  final DocsCardDataImageDTO? picture;

  @JsonKey(name: 'votes')
  final DocsCardDataVotesDTO? voteAverage;

  @JsonKey(name: 'year')
  final String? releaseDate;

  @JsonKey(name: 'description')
  final String? description;

  DocsCardDataDTO({
    required this.id,
    required this.title,
    required this.picture,
    this.releaseDate,
    this.description,
    this.voteAverage,
  });

  factory DocsCardDataDTO.fromJson(Map<String, dynamic> json) =>
      _$DocsCardDataDTOFromJson(json);
}

/// элемент image:
@JsonSerializable()
class DocsCardDataImageDTO {
  @JsonKey(name: 'previewUrl', defaultValue: '')
  final String? original;

  DocsCardDataImageDTO({
    this.original,
  });

  factory DocsCardDataImageDTO.fromJson(Map<String, dynamic> json) =>
      _$DocsCardDataImageDTOFromJson(json);
}

@JsonSerializable()
class DocsCardDataVotesDTO {
  @JsonKey(name: 'kp', defaultValue: 0)
  final double? kp;

  DocsCardDataVotesDTO({
    this.kp,
  });

  factory DocsCardDataVotesDTO.fromJson(Map<String, dynamic> json) =>
      _$DocsCardDataVotesDTOFromJson(json);
}
