import 'package:dz1/const/film_class.dart';
import 'package:dz1/models.dart';
import 'package:flutter/material.dart';

class PageArgument {
  final FilmModel data;

  PageArgument(this.data);
}

class PageFilmInformation extends StatefulWidget {
  final PageArgument arg;

  const PageFilmInformation({
    Key? key,
    required this.arg,
  }) : super(key: key);

  @override
  State<PageFilmInformation> createState() => _PageFilmInformationState();
}

class _PageFilmInformationState extends State<PageFilmInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Описание'),
      ),
      body: Container(
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
                color:
                    const Color.fromARGB(100, 50, 20, 250).withOpacity(0.3))),
        clipBehavior: Clip.hardEdge,
        child: SingleChildScrollView(
          child: Column(
            children: [
              widget.arg.data.picture,
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(height: 5),
                    Text(
                      widget.arg.data.title,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.arg.data.lang.toPrettyString(),
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.arg.data.releaseDate,
                          maxLines: 1,
                          style: const TextStyle(
                            fontSize: 20,
                            color: Colors.white60,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                            ),
                            Text(
                              widget.arg.data.voteAverage.toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white38,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.arg.data.description,
                      style: const TextStyle(
                        fontSize: 18,
                        color: Colors.white38,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
