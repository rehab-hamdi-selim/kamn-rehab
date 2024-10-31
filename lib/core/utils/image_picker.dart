import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

Future<File?> pickImage() async {
  try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (image != null) {
      final compressedPickedImage = await compressImages(image);
      if (compressedPickedImage != null) {
        return compressedPickedImage;
      } else {
        return null;
      }
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}

Future<File?> compressImages(XFile image) async {
  final compressedImageBytes = await FlutterImageCompress.compressWithFile(
    image.path,
    quality: 70,
  );
  File compressedImage = File(image.path);
  if (compressedImageBytes != null) {
    compressedImage = await compressedImage.writeAsBytes(compressedImageBytes);
    return compressedImage;
  }
  return null;
}
