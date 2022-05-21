import 'package:dio/dio.dart';
import 'package:dz1/const/const.dart';
import 'package:dz1/data/dtos/dto_start_page.dart';
import 'package:dz1/data/mappers/extension.dart';
import 'package:dz1/models/models.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class FilmRepositories {
  final Function(String, String) onErrorHandler;

  late final Dio _dio;

  FilmRepositories({required this.onErrorHandler}) {
    _dio = Dio()
      ..interceptors.addAll([
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
        ErrorInterceptor(onErrorHandler),
      ]);
  }

  Future<HomeModel?> loadData({
    required String title,
  }) async {
    const String url = Query.baseUrl;
    final Response<dynamic> response = await _dio.get<Map<dynamic, dynamic>>(
      url,
      queryParameters: <String, dynamic>{
        'token': Query.token,
        'search': title,
        'limit': '20',
        'field': 'name',
      },
    );

    final dto = (CardDTO.fromJson(response.data as Map<String, dynamic>));
    final HomeModel model = dto.toDomain();
    return model;
  }
}

class ErrorInterceptor extends Interceptor {
  ErrorInterceptor(this.onErrorHandler);

  final Function(String, String) onErrorHandler;

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    onErrorHandler(
      err.response?.statusCode?.toString() ?? '',
      err.message,
    );
    handler.next(err);
  }
}
