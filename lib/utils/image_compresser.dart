import 'package:flutter/services.dart';
import 'dart:io';
import 'dart:convert';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path_provider/path_provider.dart';

import '../constants/constants.dart';

Future<String> convertImageToBase64(File imageFile) async {
  List<int> imageBytes = await imageFile.readAsBytes();
  String base64Image = base64Encode(imageBytes);
  return base64Image;
}

Future<String> convertAssetImageToBase64(String assetPath) async {
  ByteData byteData = await rootBundle.load(assetPath);
  Uint8List imageBytes = byteData.buffer.asUint8List();
  String base64Image = base64Encode(imageBytes);
  return base64Image;
}

Uint8List base64ToBytes(String base64Image) {
  Uint8List bytes = base64Decode(base64Image);
  return bytes;
  //Use like Image.memory(bytes)
}

Future<Uint8List> convertImageToBLOB(File imageFile) async {
  Uint8List imageBytes = await imageFile.readAsBytes();
  return imageBytes;
}

Future<Uint8List> convertAssetImageToBLOB(String assetPath) async {
  ByteData byteData = await rootBundle.load(assetPath);
  Uint8List imageBytes = byteData.buffer.asUint8List();
  return imageBytes;
}

Future<File> compressImage(File imageFile) async { // see more info : https://stackoverflow.com/questions/58800808/flutter-the-best-way-to-compress-image
  final Directory tempDir = await getTemporaryDirectory();
  final String targetPath = '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';

  final File? compressedImage = await FlutterImageCompress.compressAndGetFile(
    imageFile.path,
    targetPath,
    minHeight: 480,
    minWidth: 640,
    quality: AppConstants.appImageCompressQuality,
  );

  return compressedImage!;
}