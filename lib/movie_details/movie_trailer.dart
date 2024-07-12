import 'package:flutter/material.dart';
import 'package:themovie/api_client/api_client.dart';
import 'package:themovie/entity/youtube_video_id.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieTrailer extends StatefulWidget {
  final String movieName;
  const MovieTrailer({super.key, required this.movieName});

  @override
  State<MovieTrailer> createState() => _MovieTrailerState();
}

class _MovieTrailerState extends State<MovieTrailer> {
  YouTubeVideoID? trailerId;

  void getMovieTrailer(String movieName) async {
    trailerId = await ApiClient.getYouTubeVideoID(movieName);
    setState(() {});
  }

  @override
  void initState() {
    getMovieTrailer(widget.movieName);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (trailerId == null) {
      return const Center(
        child: CircularProgressIndicator(
          color: Colors.red,
        ),
      );
    }
    return Scaffold(
      body: Center(
        child: YoutubePlayer(
          controller: YoutubePlayerController(
            initialVideoId: trailerId!.items[0].id!.videoId!,
            flags: const YoutubePlayerFlags(
              autoPlay: true,
              mute: false,
            ),
          ),
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
