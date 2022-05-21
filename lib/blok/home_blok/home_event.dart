import 'package:dz1/models/models.dart';
import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class SearchChangedEvent extends HomeEvent {
  final String search;

  const SearchChangedEvent({required this.search});

  @override
  List<Object> get props => [search];
}

class LoadDataEvent extends HomeEvent {}

/// Добавление / удаление избарнно по клику на кнопку
class ChangedFavourites extends HomeEvent {
  final FilmModel? model;

  const ChangedFavourites({required this.model});
}

/// Событие о изменении данных в БД
class ChangedFilmDB extends HomeEvent {
  final List<FilmModel> models;

  const ChangedFilmDB({required this.models});
}
