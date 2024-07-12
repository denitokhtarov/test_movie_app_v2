import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:themovie/entity/movies_by_keyword.dart';
import 'package:themovie/entity/similar_movies.dart';
import 'package:themovie/entity/stuff.dart';
import 'package:themovie/entity/movie.dart';
import 'package:themovie/entity/youtube_video_id.dart';

class ApiClient {
  static const apiKey = '4b80ec3a-3479-4507-a272-d653e6e08f6d';
  static const youTubeApiKey = 'AIzaSyDRS7JJBWOIl7nAj_wpTsTL7uUzfaHCjN0';
  static const headers = {
    'Content-Type': 'application/json',
    'X-API-KEY': apiKey,
  };
  static Future<PopularMovies> getTop250Movies() async {
    final url = Uri.parse(
        'https://kinopoiskapiunofficial.tech/api/v2.2/films/collections?type=TOP_250_MOVIES&page=1');
    final response = await http.get(url, headers: headers);

    PopularMovies top250movies = PopularMovies.fromJson(
      jsonDecode(
        utf8.decode(response.bodyBytes),
      ),
    );
    return top250movies;
  }

  static Future<PopularMovies> getThrillerMovies() async {
    final url = Uri.parse(
        'https://kinopoiskapiunofficial.tech/api/v2.2/films/collections?type=CATASTROPHE_THEME&page=1');
    final response = await http.get(url, headers: headers);

    PopularMovies thrillerMovies = PopularMovies.fromJson(
      jsonDecode(
        utf8.decode(response.bodyBytes),
      ),
    );
    return thrillerMovies;
  }

  static Future<PopularMovies> getZombiMovies() async {
    final url = Uri.parse(
        'https://kinopoiskapiunofficial.tech/api/v2.2/films/collections?type=ZOMBIE_THEME&page=1');
    final response = await http.get(
      headers: headers,
      url,
    );
    PopularMovies topPopularMovies = PopularMovies.fromJson(
      jsonDecode(
        utf8.decode(response.bodyBytes),
      ),
    );
    return topPopularMovies;
  }

  static Future<PopularMovies> getTopPopularTvShows() async {
    final url = Uri.parse(
        'https://kinopoiskapiunofficial.tech/api/v2.2/films/collections?type=TOP_250_TV_SHOWS&page=1');
    final response = await http.get(
      headers: headers,
      url,
    );
    PopularMovies topPopularTvShows = PopularMovies.fromJson(
      jsonDecode(
        utf8.decode(response.bodyBytes),
      ),
    );
    return topPopularTvShows;
  }

  static Future<PopularMovies> getComicsMovies() async {
    final url = Uri.parse(
        'https://kinopoiskapiunofficial.tech/api/v2.2/films/collections?type=COMICS_THEME&page=1');
    final response = await http.get(
      headers: headers,
      url,
    );
    PopularMovies comicsMovies = PopularMovies.fromJson(
      jsonDecode(
        utf8.decode(response.bodyBytes),
      ),
    );
    return comicsMovies;
  }

  static Future<PopularMovies> getFamilyMovies() async {
    final url = Uri.parse(
        'https://kinopoiskapiunofficial.tech/api/v2.2/films/collections?type=FAMILY&page=1');
    final response = await http.get(
      headers: headers,
      url,
    );
    PopularMovies familyMovies = PopularMovies.fromJson(
      jsonDecode(
        utf8.decode(response.bodyBytes),
      ),
    );
    return familyMovies;
  }

  static Future<List> getMovieActors(int id) async {
    final url = Uri.parse(
        'https://kinopoiskapiunofficial.tech/api/v1/staff?filmId=$id');
    final response = await http.get(
      headers: headers,
      url,
    );
    var actors = (jsonDecode(utf8.decode(response.bodyBytes)) as List)
        .map((el) => Stuff.fromJson(el))
        .toList();
    return actors;
  }

  static Future<SimilarMovies> getSimilarMovies(int id) async {
    final url = Uri.parse(
        'https://kinopoiskapiunofficial.tech/api/v2.2/films/$id/similars');
    final response = await http.get(
      headers: headers,
      url,
    );
    SimilarMovies similarMovies = SimilarMovies.fromJson(
      jsonDecode(
        utf8.decode(response.bodyBytes),
      ),
    );
    return similarMovies;
  }

  static Future<Movie> getMovieDetails(int id) async {
    final url =
        Uri.parse('https://kinopoiskapiunofficial.tech/api/v2.2/films/$id');
    final response = await http.get(
      headers: headers,
      url,
    );
    Movie movieDetails = Movie.fromJson(
      jsonDecode(
        utf8.decode(response.bodyBytes),
      ),
    );
    return movieDetails;
  }

  static Future<MoviesByKeyword> searchMovies(String keyword) async {
    final url = Uri.parse(
        'https://kinopoiskapiunofficial.tech/api/v2.1/films/search-by-keyword?keyword=$keyword&page=1');
    final response = await http.get(
      headers: headers,
      url,
    );
    MoviesByKeyword moviesByKeyword = MoviesByKeyword.fromJson(
      jsonDecode(
        utf8.decode(response.bodyBytes),
      ),
    );
    return moviesByKeyword;
  }

  static Future<YouTubeVideoID> getYouTubeVideoID(String movieName) async {
    final url = Uri.parse(
        'https://www.googleapis.com/youtube/v3/search?key=$youTubeApiKey&q=$movieName официальный трейлер');
    final response = await http.get(url);
    YouTubeVideoID movieTrailer = YouTubeVideoID.fromJson(
      jsonDecode(
        utf8.decode(response.bodyBytes),
      ),
    );
    print(movieTrailer.items[0].id!.videoId);
    return movieTrailer;
  }
}
