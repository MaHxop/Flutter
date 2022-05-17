import 'package:dio/dio.dart';
import 'package:dz1/const/api.dart';
import 'package:dz1/data/dtos/dto_start_page.dart';
import 'package:dz1/data/mappers/extension.dart';
import 'package:dz1/models/models.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class FilmRepositories {
  static final Dio _dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));

  static Future<FilmModel?> loadData() async {
    try {
      const String url = Query.baseUrl;
      final Response<dynamic> response = await _dio.get<Map<dynamic, dynamic>>(
        url,
        queryParameters: Query.baseQuery,
      );
      final CardDataDTO dto =
          CardDataDTO.fromJson(response.data as Map<String, dynamic>);
      final FilmModel model = dto.toDomain();
      return model;
    } on DioError catch (_) {
      return null;
    }
  }
}
