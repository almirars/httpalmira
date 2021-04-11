import 'dart:io';
import 'package:http/http.dart' as http;

class HttpService {
  final String apiKey = '1f13d731f88270fdbdf90ea5e7f996e7';
  final String baseUrl =
      'https://api.themoviedb.org/3/movie/550?api_key=1f13d731f88270fdbdf90ea5e7f996e7';

  Future<String> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("Sukses");
      String response = result.body;
      return response;
    } else {
      print("Fail");
      return null;
    }
  }
}
