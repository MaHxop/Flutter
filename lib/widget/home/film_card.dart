import 'package:dz1/const/widget/primary_button.dart';
import 'package:dz1/models/models.dart';
import 'package:dz1/page/page_information_film.dart';
import 'package:flutter/material.dart';

class FilmCard extends StatefulWidget {
  final FilmModel filmModel;

  //
  // factory FilmCard.model({
  //   required FilmModel model,
  //   Key? key,
  // }) {
  //   return FilmCard(
  //     filmModel: model,
  //   );
  // }

  const FilmCard({
    Key? key,
    required this.filmModel,
  }) : super(key: key);

  @override
  State<FilmCard> createState() => _FilmCardState(() {}, '');
}

class _FilmCardState extends State<FilmCard> {
  bool heart = false;
  final VoidCallback? onClickFavoriteButton;
  final String textButton;

  _FilmCardState(this.onClickFavoriteButton, this.textButton);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Material(
            child: InkWell(
              highlightColor: Colors.purpleAccent.withOpacity(0.1),
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  '/HomeScreen/PageFilmInformation',
                  arguments: PageArgument(widget.filmModel),
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
                      child: Image.network(widget.filmModel.picture),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.filmModel.title,
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
                                  widget.filmModel.voteAverage.toString(),
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
                              widget.filmModel.description,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white38,
                              ),
                            ),
                            const SizedBox(height: 40),
                            Padding(
                              padding: const EdgeInsets.all(8),
                              child:
                                  // Html(data: movieCardModel?.description ?? ''),
                                  PrimaryButton(
                                textButton,
                                onPressed: () {
                                  //Вызываем функци обратного вызова
                                  onClickFavoriteButton?.call();
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 13,
          right: 13,
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
