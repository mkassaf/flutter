import 'package:flutter/material.dart';

import '../models/image_model.dart';
import '../repo/image_repository.dart';

class NetworkImagePickerBody extends StatelessWidget {
  final ImageRepository _imageRepository = ImageRepository();

  NetworkImagePickerBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PixelFormImage>>(
      future: _imageRepository.getNetworkImage(),
      // Your Future (async operation)
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading indicator
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle errors
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          // Show image when data is ready
          return GridView.builder(
            itemCount: snapshot.data!.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
            ),
            itemBuilder: (context, index) {
              //TODO to add a GestureDetector to register click for each image
              return Image.network(snapshot.data![index].downloadUrl);
            },
          );
        } else {
          return Text("No image available");
        }
      },
    );
  }
}
