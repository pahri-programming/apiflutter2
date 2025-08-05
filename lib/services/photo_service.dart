import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:apiflutter/models/photo_model.dart'; 

class PhotoService {
  static const String photosUrl = 'https://jsonplaceholder.typicode.com/photos';

  static Future<List<Photo>> listPhoto() async {
    final response = await http.get(Uri.parse(photosUrl));

    if (response.statusCode == 200) {
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Photo.fromJson(item)).toList();
    } else {
      throw Exception('Gagal load data photo');
    }
  }
}
