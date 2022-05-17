import 'package:dz1/models/models.dart';
import 'package:dz1/page/page_information_film.dart';
import 'package:flutter/material.dart';

class FilmCard extends StatelessWidget {
  final FilmModel filmModel;

  factory FilmCard.model({
    required FilmModel model,
    Key? key,
  }) {
    return FilmCard(
      filmModel: model,
    );
  }
  const FilmCard({Key? key, required this.filmModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            highlightColor: Colors.purpleAccent.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/HomePage/PageFilmInformation',
                arguments: PageArgument(filmModel),
              );
            },
            child: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(100, 120, 30, 150),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(3, 3),
                    ),
                  ],
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                      color: const Color.fromARGB(100, 50, 20, 250)
                          .withOpacity(0.3))),
              clipBehavior: Clip.hardEdge,
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Image.network(filmModel.picture),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(height: 5),
                          Text(
                            filmModel.title,
                            maxLines: 2,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              Text(
                                filmModel.voteAverage.toString(),
                                maxLines: 1,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white60,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Text(
                            filmModel.description,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white38,
                            ),
                          ),
                          // Padding(
                          //   padding:
                          //       const EdgeInsets.only(left: 10, bottom: 10),
                          //   child: Html(data: filmModel.description ?? ''),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
