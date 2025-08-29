import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget displayImage(String? path) {
  // Si no viene nada, usa default
  if (path == null || path.trim().isEmpty) {
    return Image.asset(
      'assets/images/default.jpg',
      fit: BoxFit.cover,
    );
  }

  // Si es URL de internet
  if (path.startsWith('http://') || path.startsWith('https://')) {
    return CachedNetworkImage(
      imageUrl: path,
      fit: BoxFit.cover,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.broken_image, color: Colors.red, size: 40),
          SizedBox(height: 4),
          Text("Error de conexión", style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  // Si es asset local
  return Image.asset(
    path,
    fit: BoxFit.cover,
    errorBuilder: (context, error, stackTrace) {
      return Image.asset(
        'assets/images/default.jpg', // 🔥 fallback si el asset no existe
        fit: BoxFit.cover,
      );
    },
  );
}