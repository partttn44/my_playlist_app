import 'dart:io';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

Future<Color> getDominantColorFromPath(String imagePath) async {
  ImageProvider imageProvider;

  if (imagePath.startsWith('http') || imagePath.startsWith('https')) {
    imageProvider = NetworkImage(imagePath);
  } else if (await File(imagePath).exists()) {
    imageProvider = FileImage(File(imagePath));
  } else {
    imageProvider = AssetImage(imagePath);
  }

  try {
    final PaletteGenerator generator = await PaletteGenerator.fromImageProvider(
      imageProvider,
      maximumColorCount: 20,
    );
    return generator.dominantColor?.color ?? Colors.grey;
  } catch (e) {
    debugPrint('Error extracting color: $e');
    return Colors.grey;
  }
}
