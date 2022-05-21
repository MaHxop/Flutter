import 'package:dio/dio.dart';
import 'package:drift/drift.dart';
import 'package:dz1/const/constants.dart';
import 'package:dz1/data/db/database.dart';
import 'package:dz1/data/dtos/dto_start_page.dart';
import 'package:dz1/data/mappers/extension.dart';
import 'package:dz1/data/repositories/error_interceptor.dart';
import 'package:dz1/models/models.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class FilmRepositories {
  final Function(String, String) onErrorHandler;

  late final Dio _dio;
  late final Database _db;

  FilmRepositories({required this.onErrorHandler}) {
    _dio = Dio()
      ..interceptors.addAll([
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
        ),
        ErrorInterceptor(onErrorHandler),
      ]);
    _db = Database();
  }

  Future<HomeModel?> loadData({
    required String title,
  }) async {
    const String url = Querys.baseUrl;
    final Response<dynamic> response = await _dio.get<Map<dynamic, dynamic>>(
      url,
      queryParameters: <String, dynamic>{
        'token': Querys.token,
        'search': title,
        'limit': '20',
        'field': 'name',
      },
    );

    final dto = (CardDTO.fromJson(response.data as Map<String, dynamic>));
    final HomeModel model = dto.toDomain();
    return model;
  }

  /// Получаем весь список фильмов из базы
  Future<List<FilmModel>> getAllFilmDB() async {
    // Получаем список объектов из базы в моделях БД
    List<FilmTableData> filmDB = await _db.select(_db.filmTable).get();
    // Преобразуем модели БД в понятные модели для наших виджетов
    return filmDB
        .map((FilmTableData filmTableData) => filmTableData.toDomain())
        .toList();
  }

  /// Добавляем элемент из базы по ID
  Future<void> insertFilmDB(FilmModel filmModel) async {
    // Передаем нашу модель и преобразуем её в модель для БД с помощью .toDatabase()
    await _db.into(_db.filmTable).insert(
          filmModel.toDatabase(),
          mode: InsertMode.insertOrReplace,
        );
  }

  /// Удаляем элемент из базы по ID
  Future<void> deleteFilmDB(int id) async {
    await (_db.delete(_db.filmTable)
          ..where((filmTable) => filmTable.id.equals(id)))
        .go();
  }
  //
  // /// Подписка на изменения в БД
  // Stream<List<FilmModel>> onChangedFilmDB() {
  //   return (_db.select(_db.filmTableData))
  //       .map((FilmTableData filmTableData) => filmTableData.toDomain())
  //       .watch();
  // }
}
