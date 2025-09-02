import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

Widget displayImage(String? path) {
  // Si no viene nada, usa default
  if (path == null || path.trim().isEmpty) {
    return Image.asset('assets/images/default.jpg', fit: BoxFit.cover);
  }

  // Si es URL de internet
  if (path.startsWith('http://') || path.startsWith('https://')) {
    return CachedNetworkImage(
      imageUrl: path,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          const Center(child: CircularProgressIndicator()),
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


Future<T?> showCustomBottomSheet<T>({
  required BuildContext context,
  required Widget child,
  double minChildSize = 0.3, // porcentaje mínimo si usas DraggableScrollableSheet
  double initialChildSize = 0.6, // tamaño inicial del modal (porcentaje)
  double maxChildSize = 0.9, // máximo tamaño del modal
  Color backgroundColor = Colors.white,
  double borderRadius = 20.0,
  EdgeInsetsGeometry padding = const EdgeInsets.all(16),
}) {
  return showModalBottomSheet<T>(
    context: context,
    isScrollControlled: true, // permite crecer con teclado
    backgroundColor: Colors.transparent, // para usar bordes redondeados
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        minChildSize: minChildSize,
        initialChildSize: initialChildSize,
        maxChildSize: maxChildSize,
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(borderRadius),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10,
                    offset: Offset(0, -5),
                  ),
                ],
              ),
              padding: padding,
              child: child, // aquí va cualquier widget que quieras mostrar
            ),
          );
        },
      );
    },
  );
}