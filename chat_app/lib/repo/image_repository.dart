import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/image_model.dart';


class ImageRepository {
  Future<List<PixelFormImage>> getNetworkImage() async {
    final endpointUrl = Uri.parse('https://picsum.photos/v2/list');

    // Make the GET request
    final response = await http.get(endpointUrl);
    if (response.statusCode != 200) {
      throw Exception('Failed to load images');
    }

    final decodedList = jsonDecode(response.body) as List;
    List<PixelFormImage> imageList =
    decodedList.map((item) {
      return PixelFormImage.fromJson(item);
    }).toList();
    return imageList;
  }
}