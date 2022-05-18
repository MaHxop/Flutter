import 'package:dio/dio.dart';
import 'package:dz1/const/api.dart';
import 'package:dz1/data/dtos/dto_start_page.dart';
import 'package:dz1/data/mappers/extension.dart';
import 'package:dz1/models/models.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class FilmRepositories {
  static final Dio _dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));

  static Future<HomeModel?> loadData(
    BuildContext context, {
    required String q,
  }) async {
    try {
      const String url = Query.baseUrl;
      final Response<dynamic> response = await _dio.get<Map<dynamic, dynamic>>(
        url,
        queryParameters: <String, dynamic>{
          'token': Query.token,
          'search': q,
          'limit': '20',
          'field': 'name',
        },
      );

      final dto = (CardDTO.fromJson(response.data as Map<String, dynamic>));
      final HomeModel model = dto.toDomain();
      return model;
    } on DioError catch (_) {
      return null;
    }
  }
}
