import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../services/tmdb_service.dart';
import 'package:projet_flutter_find_your_movie/env.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Map<String, dynamic> movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final TMDBService tmdbService = TMDBService();
  String? trailerKey;
  YoutubePlayerController? _youtubeController;

  @override
  void initState() {
    super.initState();
    fetchTrailer();
  }

  @override
  void dispose() {
    _youtubeController?.dispose();
    super.dispose();
  }

  Future<void> fetchTrailer() async {
    try {
      final trailers = await tmdbService.getMovieTrailers(widget.movie['id']);
      if (trailers.isNotEmpty) {
        setState(() {
          trailerKey = trailers[0]['key'];
          _youtubeController = YoutubePlayerController(
            initialVideoId: trailerKey!,
            flags: const YoutubePlayerFlags(
              autoPlay: false,
              mute: false,
            ),
          );
        });
      }
    } catch (e) {
      print("Erreur lors de la récupération de la bande-annonce : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.movie['title'])),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.movie['id'], // Tag correspondant
                  child: Image.network(
                    '${Env.imageBaseUrl}${widget.movie['poster_path']}',
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 300,
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset(
                        'assets/images/default_poster.jpg', // Image par défaut en cas d'erreur
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 300,
                      );
                    },
                  ),
                ),
                if (trailerKey != null)
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.center,
                      child: IconButton(
                        icon: Icon(
                          Icons.play_circle_fill,
                          color: Colors.white.withOpacity(0.8),
                          size: 80,
                        ),
                        onPressed: () => showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            content: _youtubeController != null
                                ? YoutubePlayer(
                              controller: _youtubeController!,
                              showVideoProgressIndicator: true,
                            )
                                : const Text('Impossible de lire la bande-annonce.'),
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.movie['title'] ?? 'No Title',
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Rating: ${widget.movie['vote_average']}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.movie['overview'] ?? 'No description available',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Similar Movies', style: TextStyle(fontSize: 20)),
            ),
            FutureBuilder<List<dynamic>>(
              future: tmdbService.getSimilarMovies(widget.movie['id']),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final similarMovies = snapshot.data ?? [];
                  return SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: similarMovies.length,
                      itemBuilder: (context, index) {
                        final similarMovie = similarMovies[index];
                        return GestureDetector(
                          onTap: () {
                            // Détruire la page actuelle et reconstruire avec le nouveau film
                            Get.off(
                                  () => MovieDetailsScreen(movie: similarMovie),
                              preventDuplicates: false, // Important pour recharger correctement
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Column(
                              children: [
                                Hero(
                                  tag: similarMovie['id'], // Hero pour la transition
                                  child: Image.network(
                                    '${Env.imageBaseUrl}${similarMovie['poster_path']}',
                                    fit: BoxFit.cover,
                                    width: 100,
                                    height: 150,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Image.asset(
                                        'assets/images/default_poster.jpg', // Image par défaut en cas d'erreur
                                        fit: BoxFit.cover,
                                        width: 100,
                                        height: 150,
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  similarMovie['title'] ?? 'No Title',
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
