import 'package:dz1/models/models.dart';
import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
  final String? search;
  final Future<HomeModel?>? data;

// добавляем список избранных
  final List<FilmModel>? favouritesFilm;

  const HomeState({this.favouritesFilm, this.search, this.data});

  HomeState copyWith({
    String? search,
    Future<HomeModel?>? data,
    List<FilmModel>? favouritesFilm,
  }) =>
      HomeState(
        search: search ?? this.search,
        data: data ?? this.data,
        favouritesFilm: favouritesFilm ?? this.favouritesFilm,
      );

  @override
  List<Object> get props => [search ?? 0, data ?? 0, favouritesFilm ?? []];
}
