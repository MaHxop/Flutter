abstract class Film {
  final String? id;
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

class FilmNew extends Film with StringToLanguage {
  FilmNew({
    String? id,
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
  await Future.delayed(Duration(seconds: 2), () => print(nameFilm));
  return nameFilm;
}

List voteFilm() {
  List<double> vote = [5.3, 7.7, 2.5, 4.5, 9.1, 8.0];
  vote = vote.where((element) => element > 7.5).toList();
  print(vote.join(', '));
  return vote;
}

void main() {
  FilmNew language = FilmNew(language: 'Французский');
  print(language.stringToLang(language.language ?? ''));

  FilmNew numberOne = FilmNew(
    id: '1',
    title: 'Крепкий орешек',
    voteAverage: 5.3,
    releaseDate: '1988 year',
    language: 'japanese',
  );
  FilmNew numberTwo = FilmNew(
    id: '2',
    title: 'Терминатор',
    voteAverage: 7.7,
    releaseDate: '1984 year',
    language: 'english',
  );
  FilmNew numberThree = FilmNew(
    id: '3',
    title: 'Поврот не туда',
    voteAverage: 2.5,
    releaseDate: '2003 year',
    language: 'russian',
  );
  FilmNew numberFour = FilmNew(
    id: '4',
    title: 'Человек-Паук',
    voteAverage: 4.5,
    releaseDate: '2002 year',
    language: 'chinese',
  );
  FilmNew numberFive = FilmNew(
    id: '5',
    title: 'Олдбой',
    voteAverage: 9.1,
    releaseDate: '2003 year',
    language: 'korean',
  );
  FilmNew numberSix = FilmNew(
    id: '6',
    title: 'Достучаться до небес',
    voteAverage: 8.0,
    releaseDate: '1997 year',
    language: 'french',
  );
  premiereFilms();
  voteFilm();
}
