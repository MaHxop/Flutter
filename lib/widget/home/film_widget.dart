import 'package:dz1/const/film_class.dart';
import 'package:dz1/page/page_information_film.dart';
import 'package:flutter/material.dart';

class FilmWidget extends StatefulWidget {
  final String title;
  final Image picture;
  final double voteAverage;
  final String description;
  final FilmPoster link;

  const FilmWidget({
    Key? key,
    required this.title,
    required this.picture,
    required this.voteAverage,
    required this.description,
    required this.link,
  }) : super(
          key: key,
        );

  factory FilmWidget.model({
    required FilmPoster model,
    Key? key,
  }) {
    return FilmWidget(
      title: model.title,
      picture: model.picture,
      voteAverage: model.voteAverage,
      description: model.description,
      link: model,
    );
  }

  @override
  State<FilmWidget> createState() => _FilmWidgetState();
}

class _FilmWidgetState extends State<FilmWidget> {
  bool heart = false;

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
                arguments: PageArgument(widget.link),
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
                    child: widget.picture,
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
                            widget.title,
                            maxLines: 1,
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
                                widget.voteAverage.toString(),
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
                            widget.description,
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
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: GestureDetector(
            onTap: () {
              heart = !heart;
              setState(() {});
            },
            child: Icon(
              !heart ? Icons.heart_broken : Icons.favorite,
              color: !heart ? Colors.grey : Colors.red,
            ),
          ),
        ),
      ],
    );
  }
}
