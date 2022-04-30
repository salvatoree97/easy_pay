import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter_native_image/flutter_native_image.dart';

class ImageService {
  ImageService._();

  static const int mbInBytes = 1048576;
  static const int maxImageMbSize = 50;
  static const int imageQualityFactor = 50;
  static const int imageResizeFactor = 50;

  static final ImageService instance = ImageService._();

  Future<double> getImageDimensionInMB(File file) async {
    var length = await file.length();
    return length / mbInBytes;
  }

  Future<bool> isImageAllowed(File? file) async {
    if (file != null) {
      var imageSize = await ImageService.instance.getImageDimensionInMB(file);
      return imageSize <= maxImageMbSize;
    }
    return false;
  }

  Future<File> convertStringToFile(String base64) async {
    Uint8List uint8List = base64Decode(base64);
    return File.fromRawPath(uint8List);
  }

  Future<String?> convertImageToString(File image) async {
    Uint8List imageFile = await image.readAsBytes();
    return base64Encode(imageFile.toList());
  }

  Future<File> resizeImage(
    File inputFile, {
    int resizePercentage = imageResizeFactor,
    int resizeQuality = imageQualityFactor,
  }) async =>
      await FlutterNativeImage.compressImage(inputFile.path,
          quality: resizeQuality, percentage: resizePercentage);
}
