import 'package:dz1/data/dtos/dto_start_page.dart';
import 'package:dz1/models/models.dart';

extension HomeDTOToDomain on CardDTO {
  HomeModel toDomain() {
    return HomeModel(
      docs: docs?.map((CardDataDTO e) => e.toDomain()).toList(),
    );
  }
}

extension CardDataDTOToDomain on CardDataDTO {
  FilmModel toDomain() {
    return FilmModel(
      id: id,
      title: title,
      picture: picture.previewUrl,
      voteAverage: voteAverage as double,
      releaseDate: releaseDate,
      description: description,
    );
  }
}
