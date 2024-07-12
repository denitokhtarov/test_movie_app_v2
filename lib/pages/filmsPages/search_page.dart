import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themovie/api_client/api_client.dart';
import 'package:themovie/entity/movies_by_keyword.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  MoviesByKeyword? movies;

  void onChanged(String text) async {
    Timer(
      const Duration(seconds: 1),
      () async {
        movies = await ApiClient.searchMovies(text);
        setState(() {});
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CupertinoSearchTextField(
          onChanged: onChanged,
          style: const TextStyle(color: Colors.white),
          backgroundColor: CupertinoColors.darkBackgroundGray,
          autofocus: true,
        ),
      ),
      body: movies == null
          ? const SizedBox.shrink()
          : ListView.builder(
              itemCount: movies!.films.length,
              itemBuilder: (context, index) {
                return SearchMovieCard(movie: movies!.films[index]);
              },
            ),
    );
  }
}

class SearchMovieCard extends StatelessWidget {
  final MovieByKeyword movie;
  const SearchMovieCard({super.key, required this.movie});

  void onTap(BuildContext context, int id) {
    Navigator.pushNamed(context, '/movie_details', arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => onTap(context, movie.filmId!),
        child: Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: 150,
          decoration: BoxDecoration(
              color: CupertinoColors.darkBackgroundGray,
              borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              SizedBox(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                  child: Image.network(
                    movie.posterUrl!,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        maxLines: 2,
                        movie.nameRu ?? '',
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      ),
                    ),
                    Text(
                      movie.year ?? '',
                      style: const TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        movie.description ?? '',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 11),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
