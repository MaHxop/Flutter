// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dto_start_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CardDTO _$CardDTOFromJson(Map<String, dynamic> json) => CardDTO(
      docs: (json['docs'] as List<dynamic>?)
          ?.map((e) => CardDataDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CardDTOToJson(CardDTO instance) => <String, dynamic>{
      'docs': instance.docs,
    };

CardDataDTO _$CardDataDTOFromJson(Map<String, dynamic> json) => CardDataDTO(
      id: json['id'] as int? ?? 0,
      title: json['name'] as String? ?? '',
      picture: json['poster'] == null
          ? null
          : CardDataImageDTO.fromJson(json['poster'] as Map<String, dynamic>),
      voteAverage: json['votes'] == null
          ? null
          : CardDataVotesDTO.fromJson(json['votes'] as Map<String, dynamic>),
      releaseDate: json['year'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$CardDataDTOToJson(CardDataDTO instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.title,
      'poster': instance.picture,
      'votes': instance.voteAverage,
      'year': instance.releaseDate,
      'description': instance.description,
    };

CardDataImageDTO _$CardDataImageDTOFromJson(Map<String, dynamic> json) =>
    CardDataImageDTO(
      previewUrl: json['previewUrl'] as String? ?? '',
    );

Map<String, dynamic> _$CardDataImageDTOToJson(CardDataImageDTO instance) =>
    <String, dynamic>{
      'previewUrl': instance.previewUrl,
    };

CardDataVotesDTO _$CardDataVotesDTOFromJson(Map<String, dynamic> json) =>
    CardDataVotesDTO(
      kp: (json['kp'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$CardDataVotesDTOToJson(CardDataVotesDTO instance) =>
    <String, dynamic>{
      'kp': instance.kp,
    };
