import 'package:dz1/const/film_class.dart';
import 'package:dz1/models/models.dart';
import 'package:dz1/widget/home/film_widget.dart';
import 'package:flutter/material.dart';

class FilmColumn extends StatefulWidget {
  const FilmColumn({Key? key}) : super(key: key);

  @override
  State<FilmColumn> createState() => FilmColumnState();
}

class FilmColumnState extends State<FilmColumn> {
  List<FilmModel>? filmList;
  var filterFilm = <FilmModel>[];

  @override
  void initState() {
    filmList = [
      FilmModel(
        id: 1,
        title: 'Крепкий орешек',
        picture: 'https://media.b-stock.ru/gallery/2600121.jpeg',
        voteAverage: 8,
        releaseDate: '1991',
        description:
            'В суперсовременном небоскребе Лос-Анджелеса полицейский Джон МакКлейн ведет смертельную схватку с бандой политических террористов, взявших в заложники два десятка человек, в число которых попадает и его жена. Началось все с того, что парень приехал в город к жене, оказался на рождественском приеме, а кончилось настоящей войной...',
        lang: LanguageEnum.korean,
      ),
      FilmModel(
        id: 2,
        title: 'Терминатор',
        picture:
            'https://i.pinimg.com/originals/26/38/61/263861ee2fb9aa3aef15fe824aa1ebdb.jpg',
        voteAverage: 8.5,
        releaseDate: '1992',
        description:
            'История противостояния солдата Кайла Риза и киборга-терминатора, прибывших в 1984-й год из пост-апокалиптического будущего, где миром правят машины-убийцы, а человечество находится на грани вымирания. Цель киборга: убить девушку по имени Сара Коннор, чей ещё нерождённый сын к 2029 году выиграет войну человечества с машинами. Цель Риза: спасти Сару и остановить Терминатора любой ценой.',
        lang: LanguageEnum.russian,
      ),
      FilmModel(
        id: 3,
        title: 'Достучаться до небес',
        picture: 'https://kinocomment.ru/media/foto/2015/02/19/1011595766.jpg',
        voteAverage: 7.3,
        releaseDate: '1993',
        description:
            'Волею судеб две абсолютные противоположности, тихоня Руди и разгильдяй Мартин, оказываются в одной больничной палате. Узнав неутешительные прогнозы, друзья решают использовать последние дни на полную катушку — угнать машину с деньгами, напиться текилы, и, конечно, увидеть море.',
        lang: LanguageEnum.english,
      ),
      FilmModel(
        id: 4,
        title: 'Гарри Поттер',
        picture: 'https://artfiles.alphacoders.com/987/thumb-1920-98733.jpg',
        voteAverage: 6.1,
        releaseDate: '1994',
        description:
            'Жизнь десятилетнего Гарри Поттера нельзя назвать сладкой: родители умерли, едва ему исполнился год, а от дяди и тёти, взявших сироту на воспитание, достаются лишь тычки да подзатыльники. Но в одиннадцатый день рождения Гарри всё меняется. Странный гость, неожиданно появившийся на пороге, приносит письмо, из которого мальчик узнаёт, что на самом деле он - волшебник и зачислен в школу магии под названием Хогвартс. А уже через пару недель Гарри будет мчаться в поезде Хогвартс-экспресс навстречу новой жизни, где его ждут невероятные приключения, верные друзья и самое главное — ключ к разгадке тайны смерти его родителей.',
        lang: LanguageEnum.chinese,
      ),
      FilmModel(
        id: 5,
        title: 'Чужой',
        picture:
            'https://www.film.ru/sites/default/files/movies/posters/1616021-1581739.jpeg',
        voteAverage: 7.8,
        releaseDate: '1995',
        description:
            'Сюжет повествует об экипаже грузового космического корабля «Ностромо», вынужденного по контракту с Компанией исследовать неопознанный сигнал на необитаемой планете LV-426. В результате заражения на корабль проникает инопланетная форма жизни, убивающая членов экипажа. Личинка монстра попадает внутрь человека в результате заражения человека лицехватом — существом, яйца которого откладывают взрослые особи; через несколько часов после заражения личинка Чужого вырывается из груди человека, убивая его. Чужой очень быстро растёт и имеет вместо крови жидкость, схожую с мощной кислотой. Выясняется, что Чужой нужен Компании для проведения исследований и создания биологического оружия, а специально для проведения этой миссии в экипаж был внедрён андроид. Андроид выходит из строя и пытается убить Элен Рипли, после чего его уничтожают. Последняя оставшаяся в живых из всего экипажа, Рипли взрывает грузовой корабль, эвакуировавшись на шаттле, однако Чужой успевает пробраться и туда. Рипли удаётся выбросить его в открытый космос.',
        lang: LanguageEnum.korean,
      ),
      FilmModel(
        id: 6,
        title: 'Бегущий по лезвию',
        picture:
            'https://images.kinorium.com/movie/poster/77072/w1500_3573799.jpg',
        voteAverage: 5.4,
        releaseDate: '1996',
        description:
            'Отставной детектив Рик Декард вновь восстановлен в полиции Лос-Анджелеса для поиска возглавляемой Роем Батти группы киборгов, совершившей побег из космической колонии на Землю. В полиции считают, что киборги пытаются встретиться с Эндолом Тайреллом, руководителем корпорации, ставящей эксперименты над кибернетическим интеллектом. Рик Декард получает задание выяснить мотивы действий киборгов, а затем уничтожить их.',
        lang: LanguageEnum.russian,
      ),
    ];
    super.initState();
    searchFilm();
    control.addListener(searchFilm);
  }

  final control = TextEditingController();

  void searchFilm() {
    final query = control.text;
    if (query.isNotEmpty) {
      filterFilm = filmList!.where((FilmModel filmPoster) {
        return filmPoster.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      filterFilm = filmList!;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              color: const Color.fromARGB(50, 250, 50, 1000),
              child: Column(
                children: List.generate(
                  filterFilm.length,
                  (int index) => FilmWidget.model(model: filterFilm[index]),
                ),
              ),
            ),
          ),
        ),
        TextField(
          keyboardType: TextInputType.text,
          controller: control,
          decoration: const InputDecoration(
            labelText: 'Поиск',
            border: OutlineInputBorder(),
            filled: true,
            fillColor: Color.fromARGB(50, 250, 80, 1000),
          ),
        ),
      ],
    );
  }
}
