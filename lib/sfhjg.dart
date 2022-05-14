import 'package:dz1/const/film_class.dart';
import 'package:flutter/material.dart';

class Qw extends StatelessWidget {
  const Qw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('njy'),
        ),
      ),
      body: FilmW(),
    );
  }
}

class FilmW extends StatelessWidget {
  final filmList = [
    FilmPoster(
      id: 1,
      title: 'Крепкий орешек',
      picture: Image.network('https://media.b-stock.ru/gallery/2600121.jpeg'),
      voteAverage: 8,
      releaseDate: '1991',
      description:
          'В суперсовременном небоскребе Лос-Анджелеса полицейский Джон МакКлейн ведет смертельную схватку с бандой политических террористов, взявших в заложники два десятка человек, в число которых попадает и его жена. Началось все с того, что парень приехал в город к жене, оказался на рождественском приеме, а кончилось настоящей войной...',
      lang: LanguageEnum.korean,
    ),
    FilmPoster(
      id: 2,
      title: 'Терминатор',
      picture: Image.network(
          'https://i.pinimg.com/originals/26/38/61/263861ee2fb9aa3aef15fe824aa1ebdb.jpg'),
      voteAverage: 8.5,
      releaseDate: '1992',
      description:
          'История противостояния солдата Кайла Риза и киборга-терминатора, прибывших в 1984-й год из пост-апокалиптического будущего, где миром правят машины-убийцы, а человечество находится на грани вымирания. Цель киборга: убить девушку по имени Сара Коннор, чей ещё нерождённый сын к 2029 году выиграет войну человечества с машинами. Цель Риза: спасти Сару и остановить Терминатора любой ценой.',
      lang: LanguageEnum.russian,
    ),
    FilmPoster(
      id: 3,
      title: 'Достучаться до небес',
      picture: Image.network(
          'https://kinocomment.ru/media/foto/2015/02/19/1011595766.jpg'),
      voteAverage: 7.3,
      releaseDate: '1993',
      description:
          'Волею судеб две абсолютные противоположности, тихоня Руди и разгильдяй Мартин, оказываются в одной больничной палате. Узнав неутешительные прогнозы, друзья решают использовать последние дни на полную катушку — угнать машину с деньгами, напиться текилы, и, конечно, увидеть море.',
      lang: LanguageEnum.korean,
    ),
    FilmPoster(
      id: 4,
      title: 'Гарри Поттер',
      picture: Image.network(
          'https://artfiles.alphacoders.com/987/thumb-1920-98733.jpg'),
      voteAverage: 6.1,
      releaseDate: '1994',
      description:
          'Жизнь десятилетнего Гарри Поттера нельзя назвать сладкой: родители умерли, едва ему исполнился год, а от дяди и тёти, взявших сироту на воспитание, достаются лишь тычки да подзатыльники. Но в одиннадцатый день рождения Гарри всё меняется. Странный гость, неожиданно появившийся на пороге, приносит письмо, из которого мальчик узнаёт, что на самом деле он - волшебник и зачислен в школу магии под названием Хогвартс. А уже через пару недель Гарри будет мчаться в поезде Хогвартс-экспресс навстречу новой жизни, где его ждут невероятные приключения, верные друзья и самое главное — ключ к разгадке тайны смерти его родителей.',
      lang: LanguageEnum.russian,
    ),
    FilmPoster(
      id: 5,
      title: 'Чужой',
      picture: Image.network(
          'https://www.film.ru/sites/default/files/movies/posters/1616021-1581739.jpeg'),
      voteAverage: 7.8,
      releaseDate: '1995',
      description:
          'Сюжет повествует об экипаже грузового космического корабля «Ностромо», вынужденного по контракту с Компанией исследовать неопознанный сигнал на необитаемой планете LV-426. В результате заражения на корабль проникает инопланетная форма жизни, убивающая членов экипажа. Личинка монстра попадает внутрь человека в результате заражения человека лицехватом — существом, яйца которого откладывают взрослые особи; через несколько часов после заражения личинка Чужого вырывается из груди человека, убивая его. Чужой очень быстро растёт и имеет вместо крови жидкость, схожую с мощной кислотой. Выясняется, что Чужой нужен Компании для проведения исследований и создания биологического оружия, а специально для проведения этой миссии в экипаж был внедрён андроид. Андроид выходит из строя и пытается убить Элен Рипли, после чего его уничтожают. Последняя оставшаяся в живых из всего экипажа, Рипли взрывает грузовой корабль, эвакуировавшись на шаттле, однако Чужой успевает пробраться и туда. Рипли удаётся выбросить его в открытый космос.',
      lang: LanguageEnum.korean,
    ),
    FilmPoster(
      id: 6,
      title: 'Бегущий по лезвию',
      picture: Image.network(
          'https://images.kinorium.com/movie/poster/77072/w1500_3573799.jpg'),
      voteAverage: 5.4,
      releaseDate: '1996',
      description:
          'Отставной детектив Рик Декард вновь восстановлен в полиции Лос-Анджелеса для поиска возглавляемой Роем Батти группы киборгов, совершившей побег из космической колонии на Землю. В полиции считают, что киборги пытаются встретиться с Эндолом Тайреллом, руководителем корпорации, ставящей эксперименты над кибернетическим интеллектом. Рик Декард получает задание выяснить мотивы действий киборгов, а затем уничтожить их.',
      lang: LanguageEnum.russian,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: filmList.length,
      itemExtent: 200,
      itemBuilder: (BuildContext context, int index) {
        final films = filmList[index];
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(100, 120, 30, 180),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(3, 3),
                          ),
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(
                            color: const Color.fromARGB(100, 50, 20, 250)
                                .withOpacity(0.3))),
                    clipBehavior: Clip.hardEdge,
                    child: Row(
                      children: [
                        films.picture,
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 5),
                                Text(
                                  films.title,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  films.releaseDate,
                                  maxLines: 1,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white60,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  films.description,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.white38,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      highlightColor: Colors.purpleAccent.withOpacity(0.1),
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
