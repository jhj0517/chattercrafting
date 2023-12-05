import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

import '../constants/color_constants.dart';
import '../models/sqflite/character.dart';

class FullPhotoPage extends StatelessWidget {
  final FullPhotoPageArguments arguments;

  const FullPhotoPage({Key? key, required this.arguments}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          arguments.character.botName,
          style: const TextStyle(
            color: Colors.white
          ),
        ),
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: PhotoView(
        imageProvider: MemoryImage(arguments.character.photoBLOB),
      ),
    );
  }
}

class FullPhotoPageArguments {
  final Character character;

  FullPhotoPageArguments({required this.character});
}