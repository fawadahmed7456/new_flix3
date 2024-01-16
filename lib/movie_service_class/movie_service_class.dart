import 'dart:convert';
import 'package:new_flix_2/models/movie_model_class.dart';
import 'package:http/http.dart' as http;

class MovieService {
  static Future<List<Movie>> getMovies(path) async {
    final responce = await http.get(Uri.parse(path));
    if (responce.statusCode == 200) {
      final decodedData = json.decode(responce.body)['results'] as List;

      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Error in generating responce");
    }
  }
}
