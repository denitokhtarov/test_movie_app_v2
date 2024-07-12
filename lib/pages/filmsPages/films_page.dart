import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themovie/api_client/api_client.dart';
import 'package:themovie/entity/movie.dart';

class FilmPage extends StatefulWidget {
  const FilmPage({super.key});

  @override
  State<FilmPage> createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> {
  PopularMovies? popularMovies;
  void getPopularMovies() async {
    popularMovies = await ApiClient.getTopPopularTvShows();
    setState(() {});
  }

  @override
  void initState() {
    getPopularMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (popularMovies == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    FocusNode myFocus = FocusNode();

    return Scaffold(
      appBar: AppBar(
        title: CupertinoSearchTextField(
          onTap: () {
            myFocus.unfocus();
            Navigator.pushNamed(context, '/search_page');
          },
          focusNode: myFocus,
          style: const TextStyle(color: Colors.grey),
          placeholder: 'Поиск',
          backgroundColor: CupertinoColors.darkBackgroundGray,
        ),
      ),
      body: GridView.builder(
        itemCount: popularMovies!.items.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, childAspectRatio: 0.7),
        itemBuilder: (context, index) {
          return MovieCard(popularMovies: popularMovies, index: index);
        },
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  void onMovieTap(BuildContext context, int id) {
    Navigator.pushNamed(context, '/movie_details', arguments: id);
  }

  final int index;
  final PopularMovies? popularMovies;
  const MovieCard(
      {super.key, required this.popularMovies, required this.index});

  @override
  Widget build(BuildContext context) {
    if (popularMovies == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () =>
            onMovieTap(context, popularMovies!.items[index].kinopoiskId!),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            popularMovies!.items[index].posterUrl!,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
