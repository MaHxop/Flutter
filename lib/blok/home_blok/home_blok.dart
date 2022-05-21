import 'package:dz1/blok/home_blok/home_event.dart';
import 'package:dz1/blok/home_blok/home_state.dart';
import 'package:dz1/const/constants.dart';
import 'package:dz1/data/repositories/repositories.dart';
import 'package:dz1/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final FilmRepositories repository;

  HomeBloc(this.repository) : super(const HomeState()) {
    on<LoadDataEvent>(_onLoadData);
    on<SearchChangedEvent>(_onSearchChanged);
    // Добавим обработчики события
    on<ChangedFavourites>(_onClickFavourites);
    on<ChangedFilmDB>(_onChangedDB);

    // // Подписываемя на Stream об изменении данных в БД
    // repository.onChangedFilmDB().listen((List<FilmModel> changedFilmDB) {
    //   add(ChangedFilmsDB(models: changedFilmDB));
    // });
  }

  String get search {
    final stateSearch = state.search;
    return (stateSearch != null && stateSearch.isNotEmpty)
        ? stateSearch
        : Querys.baseQuery;
  }

  void _onSearchChanged(SearchChangedEvent event, Emitter<HomeState> emit) {
    // search must be emitted before loading data
    emit(state.copyWith(search: event.search));
    emit(state.copyWith(data: repository.loadData(title: search)));
  }

  void _onLoadData(LoadDataEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(data: repository.loadData(title: search)));
  }

  void _onClickFavourites(
      ChangedFavourites event, Emitter<HomeState> emit) async {
    final FilmModel? targetMovie = event.model;

    FilmModel? movie;
    // Проверяем что список избранных не пуст
    if (state.favouritesFilm?.isNotEmpty == true) {
      // проверяем есть ли в избранном фильм
      movie = state.favouritesFilm
          ?.firstWhere((element) => element.id == targetMovie?.id);
    }
    // если есть удаляем из базы, если нет то добавляем в базу
    if (movie != null) {
      await repository.deleteFilmDB(movie.id);
    } else if (targetMovie != null) {
      await repository.insertFilmDB(targetMovie);
    }
  }

  void _onChangedDB(ChangedFilmDB event, Emitter<HomeState> emit) {
    emit(state.copyWith(favouritesFilm: event.models));
  }
}
