import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:projet_flutter_find_your_movie/env.dart';

class TMDBService {
  final String _apiKey = Env.apiKey;
  final String _baseUrl = Env.baseUrl;
  final String _imageBaseUrl = Env.imageBaseUrl;
  final http.Client client;

  TMDBService({http.Client? client}) : client = client ?? http.Client();

  Future<List<dynamic>> getPopularMovies() async {
    final url = Uri.parse('$_baseUrl/movie/popular?api_key=$_apiKey');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['results'];
    } else {
      throw Exception("Failed to load popular movies");
    }
  }

  Future<Map<String, dynamic>> getMovieDetails(int movieId) async {
    final url = Uri.parse('$_baseUrl/movie/$movieId?api_key=$_apiKey');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load movie details");
    }
  }

  Future<List<dynamic>> getSimilarMovies(int movieId) async {
    final url = Uri.parse('$_baseUrl/movie/$movieId/similar?api_key=$_apiKey');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['results'];
    } else {
      throw Exception("Failed to load similar movies");
    }
  }

  Future<List<dynamic>> getMovieTrailers(int movieId) async {
    final url = Uri.parse('$_baseUrl/movie/$movieId/videos?api_key=$_apiKey');
    final response = await client.get(url);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['results'] ?? [];
    } else {
      throw Exception('Failed to load movie trailers');
    }
  }
}
