import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:themovie/api_client/api_client.dart';
import 'package:themovie/entity/movie.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  PopularMovies? thrillerMovies;
  PopularMovies? topPopularTvShows;
  PopularMovies? familyMovies;
  PopularMovies? comicsMovies;
  PopularMovies? top250movies;
  PopularMovies? zombiMovies;
  PageController pageController =
      PageController(initialPage: 0, viewportFraction: 1);
  int currentPage = 0;

  void getFamiyMovies() async {
    familyMovies = await ApiClient.getFamilyMovies();
    setState(() {});
  }

  void getThillerMovies() async {
    thrillerMovies = await ApiClient.getThrillerMovies();
    setState(() {});
  }

  void getComicsMovies() async {
    comicsMovies = await ApiClient.getComicsMovies();
    setState(() {});
  }

  void getTopPopularTvShows() async {
    topPopularTvShows = await ApiClient.getTopPopularTvShows();
    setState(() {});
  }

  void getTop250Movies() async {
    top250movies = await ApiClient.getTop250Movies();
    setState(() {});
  }

  void getZombiMovies() async {
    zombiMovies = await ApiClient.getZombiMovies();
    setState(() {});
  }

  @override
  void initState() {
    getTopPopularTvShows();
    getComicsMovies();
    getTop250Movies();
    getFamiyMovies();
    getZombiMovies();
    getThillerMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final moviesByComics = comicsMovies?.items;
    final moviesFromTop250 = top250movies?.items;
    final moviesWithZombies = zombiMovies?.items;
    final tvShowsFromTopPopular = topPopularTvShows?.items;
    final moviesForFamilyWatch = familyMovies?.items;
    final thrillerMovie = thrillerMovies?.items;
    if (top250movies == null ||
        comicsMovies == null ||
        zombiMovies == null ||
        topPopularTvShows == null ||
        familyMovies == null) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      );
    }
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          introPosters(context),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: buildPageIndicatorWidget(),
          ),
          const SizedBox(
            height: 40,
          ),
          MoviesSection(
            sectionName: 'Фильмы из топ-250',
            movies: moviesFromTop250!,
          ),
          MoviesSection(
            sectionName: 'Смотрят сейчас',
            movies: moviesWithZombies!,
          ),
          MoviesSection(
            sectionName: 'Сериалы, от которых невозможно оторваться',
            movies: tvShowsFromTopPopular!,
          ),
          MoviesSection(
            sectionName: 'Фильмы по комиксам',
            movies: moviesByComics!,
          ),
          MoviesSection(
            sectionName: 'Для всей семьи',
            movies: moviesForFamilyWatch!,
          ),
          thrillerMovie == null
              ? const SizedBox.shrink()
              : MoviesSection(sectionName: 'Триллеры', movies: thrillerMovie),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'developed by Tokhtarov Deni.',
                style: GoogleFonts.montserrat(color: Colors.grey, fontSize: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> buildPageIndicatorWidget() {
    List<Widget> list = [];
    for (int i = 0; i < 5; i++) {
      list.add(i == currentPage ? indicator(true) : indicator(false));
    }
    return list;
  }

  Widget indicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      height: 5,
      width: 5,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.white : Colors.white24,
      ),
    );
  }

  SizedBox introPosters(BuildContext context) {
    final movies = topPopularTvShows!.items;
    void onPageChanged(int page) {
      setState(
        () {
          currentPage = page;
        },
      );
    }

    void onTap(int movieId) {
      Navigator.pushNamed(context, '/movie_details', arguments: movieId);
    }

    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.75,
      child: PageView.builder(
        physics: const BouncingScrollPhysics(),
        controller: pageController,
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => onTap(movies[index].kinopoiskId!),
            child: IntroPoster(
              movie: movies[index],
            ),
          );
        },
        onPageChanged: onPageChanged,
      ),
    );
  }
}

class IntroPoster extends StatelessWidget {
  const IntroPoster({
    super.key,
    required this.movie,
  });

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(movie.coverUrl!),
            ),
          ),
        ),
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(0, 0, 0, 0),
                Color.fromARGB(255, 7, 7, 7),
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              movie.logoUrl != null
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50, vertical: 10),
                      child: Image.network(movie.logoUrl!),
                    )
                  : Text(
                      textAlign: TextAlign.center,
                      movie.nameRu!,
                      style: GoogleFonts.montserrat(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.w900),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    movie.genres![0].genre!,
                    style: const TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 7),
                  if (movie.ratingAgeLimits == 'age18')
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Text(
                          '18+',
                          style: TextStyle(color: Colors.white, fontSize: 11),
                        ),
                      ),
                    )
                  else
                    const SizedBox.shrink()
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20, left: 10, right: 15),
                child: Text(
                  movie.description!,
                  maxLines: 2,
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.quicksand(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.normal),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class MoviesSection extends StatelessWidget {
  final List<Movie> movies;
  final String sectionName;
  const MoviesSection(
      {super.key, required this.sectionName, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            overflow: TextOverflow.ellipsis,
            sectionName,
            style: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        CardWithPoster(movies: movies)
      ],
    );
  }
}

class CardWithPoster extends StatelessWidget {
  final List<Movie> movies;
  const CardWithPoster({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    void onMovieTap(int movieID) {
      Navigator.pushNamed(context, '/movie_details', arguments: movieID);
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SizedBox(
            height: 300,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              separatorBuilder: (context, index) => const SizedBox(
                width: 20,
              ),
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Stack(
                      children: [
                        InkWell(
                          onTap: () => onMovieTap(movies[index].kinopoiskId!),
                          child: Container(
                            height: 200,
                            width: 150,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(9),
                              image: DecorationImage(
                                fit: BoxFit.fill,
                                image: NetworkImage(movies[index].posterUrl!),
                              ),
                            ),
                          ),
                        ),
                        movies[index].ratingKinopoisk == null
                            ? const SizedBox.shrink()
                            : MovieRatingIndicator(movie: movies[index])
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      width: 150,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            movies[index].nameRu!,
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            movies[index].year?.toString() ?? '',
                            style: const TextStyle(
                              color: Colors.white38,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class MovieRatingIndicator extends StatelessWidget {
  final Movie movie;
  const MovieRatingIndicator({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    Color? backgroundColor;
    if (movie.ratingKinopoisk == null) {
      backgroundColor = Colors.green;
    } else {
      movie.ratingKinopoisk! >= 7
          ? backgroundColor = Colors.green
          : backgroundColor = Colors.orange;
    }
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: SizedBox(
        height: 20,
        width: 30,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(9),
          ),
          child: Center(
            child: Text(
              movie.ratingKinopoisk.toString(),
              style: GoogleFonts.openSans(
                  color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}
