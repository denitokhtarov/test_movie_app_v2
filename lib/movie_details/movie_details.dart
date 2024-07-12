import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:themovie/api_client/api_client.dart';
import 'package:themovie/entity/similar_movies.dart';
import 'package:themovie/entity/stuff.dart';
import 'package:themovie/entity/movie.dart';

class MovieDetailsWidget extends StatefulWidget {
  final int? id;
  const MovieDetailsWidget({
    super.key,
    required this.id,
  });

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  SimilarMovies? similarMovies;
  List<Stuff>? stuff;
  Movie? movie;

  void getMovieDetails() async {
    movie = await ApiClient.getMovieDetails(widget.id!);
    setState(() {});
  }

  void getSimilarMovies() async {
    similarMovies = await ApiClient.getSimilarMovies(widget.id!);
    setState(() {});
  }

  void getMovieActors() async {
    stuff = await ApiClient.getMovieActors(widget.id!) as List<Stuff>;
    setState(() {});
  }

  @override
  void initState() {
    getMovieDetails();
    getMovieActors();
    getSimilarMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (movie == null) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      );
    }
    List movieGenres = [];

    if (movie?.genres != null) {
      for (var genres in movie!.genres!) {
        movieGenres.add(genres.genre);
      }
    }
    String genres = movieGenres.length >= 3
        ? movieGenres.getRange(0, 3).toList().join(', ')
        : movieGenres.join(', ');
    String movieYear = movie?.year != null ? '${movie?.year},' : '';
    String movieCountry =
        movie?.countries == null ? '' : '${movie!.countries!.first.country},';
    String isForAdults = movie?.ratingAgeLimits == null
        ? ''
        : movie!.ratingAgeLimits == 'age18'
            ? '18+'
            : '6+';
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppBarPoster(movie: movie!),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                movie?.ratingKinopoisk != null
                    ? Text(
                        movie!.ratingKinopoisk?.toString() ?? '',
                        style: GoogleFonts.outfit(
                          color: movie!.ratingKinopoisk! >= 7
                              ? Colors.green
                              : Colors.orange,
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                        ),
                      )
                    : const SizedBox.shrink(),
                const SizedBox(width: 14),
                Text(
                  movie?.nameOriginal ?? '',
                  style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$movieYear $genres',
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$movieCountry $isForAdults',
                  style: const TextStyle(color: Colors.grey, fontSize: 15),
                )
              ],
            ),
            const SizedBox(height: 20),
            TrailerButton(
              movieName: movie!.nameRu!,
            ),
            const SizedBox(height: 35),
            const SizedBox(
              height: 0.2,
              width: double.infinity,
              child: ColoredBox(color: Colors.grey),
            ),
            const SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                movie!.description!,
                style:
                    GoogleFonts.montserrat(color: Colors.white, fontSize: 15.3),
              ),
            ),
            const SizedBox(height: 50),
            StuffMembers(stuff: stuff),
            SimilarMoviesWidget(similarMovies: similarMovies)
          ],
        ),
      ),
    );
  }
}

class TrailerButton extends StatelessWidget {
  final String movieName;
  const TrailerButton({super.key, required this.movieName});

  void onTrailerButtonTap(BuildContext context) {
    Navigator.pushNamed(context, '/movie_details/trailer',
        arguments: movieName);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTrailerButtonTap(context),
      child: Container(
        height: 60,
        width: 225,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: const LinearGradient(
            colors: [
              Color.fromARGB(255, 255, 0, 85),
              Color.fromARGB(255, 0, 140, 255)
            ],
          ),
        ),
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.play_arrow,
                color: Colors.white,
                size: 30,
              ),
              Text(
                'Смотреть трейлер',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 17),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppBarPoster extends StatelessWidget {
  const AppBarPoster({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.5,
          decoration: BoxDecoration(
            image: DecorationImage(
              isAntiAlias: true,
              fit: BoxFit.cover,
              image: NetworkImage(movie.coverUrl ?? movie.posterUrl!),
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(0, 0, 0, 0),
                  Color.fromARGB(255, 0, 0, 0),
                ],
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                movie.logoUrl == null
                    ? Text(
                        textAlign: TextAlign.center,
                        movie.nameRu!,
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 35,
                            fontWeight: FontWeight.w900),
                      )
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: Image.network(movie.logoUrl!),
                      ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class StuffMembers extends StatelessWidget {
  final List<Stuff>? stuff;
  const StuffMembers({super.key, required this.stuff});

  @override
  Widget build(BuildContext context) {
    if (stuff == null) {
      return const CircularProgressIndicator(
        color: Colors.red,
      );
    }
    List<Stuff> actors = stuff!
        .where((el) => el.professionText == 'Актеры')
        .toList()
        .getRange(0, 10)
        .toList();

    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Актеры и съемочная группа',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w900,
                    fontSize: 22),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 270,
          child: ListView.builder(
            itemCount: actors.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: SizedBox(
                  height: 200,
                  width: 120,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 180,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            actors[index].posterUrl!,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        actors[index].nameRu!,
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 13),
                      ),
                      Text(
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        actors[index].description!,
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 12),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

class SimilarMoviesWidget extends StatelessWidget {
  final SimilarMovies? similarMovies;
  const SimilarMoviesWidget({super.key, required this.similarMovies});

  void onMovieTap(BuildContext context, int movieId) {
    Navigator.pushNamed(context, '/movie_details', arguments: movieId);
  }

  @override
  Widget build(BuildContext context) {
    if (similarMovies == null) {
      return const CircularProgressIndicator(color: Colors.red);
    }
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Похожие фильмы',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: similarMovies!.items.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: GestureDetector(
                  onTap: () =>
                      onMovieTap(context, similarMovies!.items[index].filmId!),
                  child: SizedBox(
                    height: 240,
                    width: 120,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 180,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              similarMovies!.items[index].posterUrl!,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Text(
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          similarMovies!.items[index].nameRu!,
                          style: GoogleFonts.poppins(
                              color: Colors.white, fontSize: 13),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
