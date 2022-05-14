import 'package:dz1/const/film_class.dart';
import 'package:dz1/page/page_information_film.dart';
import 'package:dz1/widget/home/list_widget_film.dart';
import 'package:flutter/material.dart';

class FilmWidget extends StatefulWidget {
  final FilmPoster film;

  const FilmWidget({
    Key? key,
    required this.film,
  }) : super(
          key: key,
        );

  @override
  State<FilmWidget> createState() => _FilmWidgetState();
}

class _FilmWidgetState extends State<FilmWidget> {
  get filmList => FilmColumnState;
  bool heart = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              Container(
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
                      child: widget.film.picture,
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(height: 5),
                          Text(
                            widget.film.title,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.film.releaseDate,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white60,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            widget.film.lang.toPrettyString(),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white38,
                            ),
                          ),
                          TextButton(
                            style: ButtonStyle(
                              foregroundColor:
                                  MaterialStateProperty.all(Colors.purple),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/HomePage/PageFilmInformation',
                                arguments: PageArgument(widget.film),
                              );
                            },
                            child: const Text('Подробности'),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 7,
                      right: 7,
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
                ),
              ),
              // Material(
              //   color: Colors.transparent,
              //   child: InkWell(
              //     highlightColor: Colors.purpleAccent.withOpacity(0.1),
              //     borderRadius: const BorderRadius.all(Radius.circular(10)),
              //     onTap: () {},
              //   ),
              // ),
            ],
          ),
        ),
      ],
    );
  }
}
