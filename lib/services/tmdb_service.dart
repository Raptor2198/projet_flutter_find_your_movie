import 'dart:convert';
import 'package:http/http.dart' as http;
import '../constants/api_constants.dart';

class TMDBService {
  final String _apiKey = ApiConstants.apiKey;
  final String _baseUrl = "https://api.themoviedb.org/3";
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
    final url = '${ApiConstants.baseUrl}/movie/$movieId/videos?api_key=${ApiConstants.apiKey}';
    final response = await client.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['results'] ?? [];
    } else {
      throw Exception('Failed to load movie trailers');
    }
  }
}
