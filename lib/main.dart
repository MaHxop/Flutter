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
  Language? stringToLang(String a) {
    switch (a) {
      case 'Русский':
        return Language.russian;
      case 'Китайский':
        return Language.chinese;
      case 'Английский':
        return Language.english;
      case 'Испанский':
        return Language.spanish;
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
  spanish,
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

void main() {
  FilmNew a = FilmNew(language: 'Французский');
  print(a.stringToLang(a.language ?? ''));
}
