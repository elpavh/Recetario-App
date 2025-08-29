import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget displayImage(String path) {
  // Verifica si la ruta es un URL de internet
  if (path.startsWith('http://') || path.startsWith('https://')) {
    // Si es un URL, usa un widget de la librería 'cached_network_image'
    return CachedNetworkImage(
      imageUrl: path,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(), // Muestra un círculo de carga mientras descarga
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error), // Muestra un icono de error si falla
    );
  } else {
    // Si no es un URL, asume que es un asset local
    return Image.asset(path, fit: BoxFit.cover);
  }
}