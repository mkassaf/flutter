import 'package:flutter/material.dart';

import '../models/image_model.dart';
import '../repo/image_repository.dart';

class NetworkImagePickerBody extends StatelessWidget {
  final ImageRepository _imageRepository = ImageRepository();
  void Function(String) onImageSelected;

  NetworkImagePickerBody({super.key, required this.onImageSelected});

  @override
  Widget build(BuildContext context) {
    //TODO: Make the picker body rounded
    return FutureBuilder<List<PixelFormImage>>(
      future: _imageRepository.getNetworkImage(),
      // Your Future (async operation)
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show loading indicator
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Handle errors
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30.0,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, color: Colors.red, size: 50),
                  SizedBox(height: 10),
                  Text("Something went wrong. Details: ${snapshot.error}"),
                ],
              ),
            ),
          );
        } else if (snapshot.hasData) {
          // Show image when data is ready
          return GridView.builder(
            itemCount: snapshot.data!.length,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: MediaQuery.of(context).size.width * 0.5,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  onImageSelected(snapshot.data![index].downloadUrl);
                  Navigator.of(context).pop();
                },
                child: Image.network(snapshot.data![index].downloadUrl),
              );
            },
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("No image available"),
          );
        }
      },
    );
  }
}
