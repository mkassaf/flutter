import 'dart:convert';
import 'dart:io';
import 'dart:async';

import 'package:http/http.dart' as http;
import '../models/image_model.dart';

class ImageRepository {

  final _baseUrl = 'https://picsum.photos/v2/list2';

  Future<List<PixelFormImage>> getNetworkImage({int maxRetries = 20, Duration initialDelay = const Duration(seconds: 1)}) async {
    final endpointUrl = Uri.parse(_baseUrl);
    int attempt = 0;

    while (attempt < maxRetries) {
      try {
        final response = await http.get(endpointUrl);

        if (response.statusCode != 200) {
          throw HttpException('Failed to load images. Status code: ${response.statusCode}');
        }

        final decodedList = jsonDecode(response.body) as List;
        List<PixelFormImage> imageList = decodedList.map((item) => PixelFormImage.fromJson(item)).toList();
        return imageList; // Success: return data

      } on SocketException {
        attempt++;
        if (attempt >= maxRetries) {
          throw Exception("No internet connection. Please check your network.");
        }
        print("Network issue detected. Retrying in ${initialDelay.inSeconds * attempt} seconds...");
        await Future.delayed(initialDelay * attempt); // Exponential backoff
      } on HttpException catch (e) {
        throw Exception("HTTP error: ${e.message}");
      } on FormatException {
        throw Exception("Invalid response format. Unable to parse the data.");
      } catch (e) {
        throw Exception("An unexpected error occurred: $e");
      }
    }
    throw Exception("Failed to fetch images after multiple attempts.");
  }
}
