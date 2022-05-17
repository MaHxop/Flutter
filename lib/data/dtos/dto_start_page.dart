import 'package:json_annotation/json_annotation.dart';

part 'dto_start_page.g.dart';

/// Корневой элемент Json
@JsonSerializable()
class CardDTO {
  @JsonKey(name: 'docs')
  final List<CardDataDTO>? docs;

  CardDTO({required this.docs});

  factory CardDTO.fromJson(Map<String, dynamic> json) =>
      _$CardDTOFromJson(json);
}

/// элемент docs:
@JsonSerializable()
class CardDataDTO {
  @JsonKey(name: 'id', defaultValue: 0)
  final int id;

  @JsonKey(name: 'name', defaultValue: 'Название отсутствеут')
  final String title;

  @JsonKey(name: 'poster')
  final CardDataImageDTO picture;

  @JsonKey(name: 'rating')
  final CardDataVotesDTO voteAverage;

  @JsonKey(name: 'year', defaultValue: 0)
  final int releaseDate;

  @JsonKey(name: 'description', defaultValue: 'Описание отсутствует')
  final String description;

  CardDataDTO({
    required this.id,
    required this.title,
    required this.picture,
    required this.voteAverage,
    required this.releaseDate,
    required this.description,
  });

  factory CardDataDTO.fromJson(Map<String, dynamic> json) =>
      _$CardDataDTOFromJson(json);
}

/// элемент image:
@JsonSerializable()
class CardDataImageDTO {
  @JsonKey(name: 'previewUrl', defaultValue: 'Картинки нет')
  final String previewUrl;

  CardDataImageDTO({
    required this.previewUrl,
  });

  factory CardDataImageDTO.fromJson(Map<String, dynamic> json) =>
      _$CardDataImageDTOFromJson(json);
}

@JsonSerializable()
class CardDataVotesDTO {
  @JsonKey(name: 'kp', defaultValue: 0)
  final double kp;

  CardDataVotesDTO({
    required this.kp,
  });

  factory CardDataVotesDTO.fromJson(Map<String, dynamic> json) =>
      _$CardDataVotesDTOFromJson(json);
}
