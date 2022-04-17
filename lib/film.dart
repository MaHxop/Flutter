abstract class Film {
  final int? id;
  final String? title;
  final String? picture;
  final double? voteAverage;
  final String? releaseDate;
  final String? description;
  final String? language;

  Film({
    this.id,
    this.title,
    this.picture,
    this.voteAverage,
    this.releaseDate,
    this.description,
    this.language,
  });
}

mixin StringToLanguage {
  Language? stringToLang(String language) {
    switch (language) {
      case 'Русский':
        return Language.russian;
      case 'Китайский':
        return Language.chinese;
      case 'Английский':
        return Language.english;
      case 'Корейский':
        return Language.korean;
      case 'Японский':
        return Language.japanese;
      case 'Французский':
        return Language.french;
      default:
        return null;
    }
  }
}

enum Language {
  russian,
  chinese,
  english,
  korean,
  japanese,
  french,
}

class FilmData extends Film with StringToLanguage {
  FilmData({
    int? id,
    String? title,
    String? picture,
    double? voteAverage,
    String? releaseDate,
    String? description,
    String? language,
  }) : super(
          id: id,
          title: title,
          picture: picture,
          voteAverage: voteAverage,
          releaseDate: releaseDate,
          description: description,
          language: language,
        );

  void information() {
    print(
      'Номер: $id \nНазвание: $title \nРейтинг: $voteAverage \nГод выхода: $releaseDate \nЯзык: $language',
    );
  }

  static List<FilmData> get testFilm => [
        FilmData(
            id: 1,
            title: 'Крепкий орешек',
            voteAverage: 5.3,
            releaseDate: '1988 year',
            language: 'Японский'),
        FilmData(
            id: 2,
            title: 'Терминатор',
            voteAverage: 7.7,
            releaseDate: '1984 year',
            language: 'Английский'),
        FilmData(
            id: 3,
            title: 'Поврот не туда',
            voteAverage: 2.5,
            releaseDate: '2003 year',
            language: 'Русский'),
        FilmData(
            id: 4,
            title: 'Человек-Паук',
            voteAverage: 4.5,
            releaseDate: '2002 year',
            language: 'Китайский'),
        FilmData(
            id: 5,
            title: 'Олдбой',
            voteAverage: 9.1,
            releaseDate: '2003 year',
            language: 'Корейский'),
        FilmData(
            id: 6,
            title: 'Достучаться до небес',
            voteAverage: 8.0,
            releaseDate: '1997 year',
            language: 'Французский'),
      ];
}

Future<List> premiereFilms() async {
  List<String> nameFilm = [
    'Крепкий орешек',
    'Терминатор',
    'Поврот не туда',
    'Человек-Паук',
    'Олдбой',
    'Достучаться до небес'
  ];
  await Future.delayed(const Duration(seconds: 2), () => print(nameFilm));
  return nameFilm;
}

void ratingFilm(List<FilmData> filmList) {
  final vote = filmList
      .where((FilmData element) =>
          (element.id ?? 0) >= 5 && (element.voteAverage ?? 0) >= 8.5)
      .toList();
  for (final a in vote) {
    a.information();
  }
}
