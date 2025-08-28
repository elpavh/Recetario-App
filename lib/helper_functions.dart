import 'package:flutter/material.dart';

Widget displayImage(String path) {
  // Check if the path is a valid URL
  if (path.startsWith('http://') || path.startsWith('https://')) {
    // If it's a URL, return an Image.network widget
    return Image.network(path, fit: BoxFit.cover);
  } else {
    // If it's not a URL, assume it's a local asset
    return Image.asset(path, fit: BoxFit.cover);
  }
}