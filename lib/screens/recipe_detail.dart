import 'package:flutter/material.dart';


class RecipeDetail extends StatelessWidget {
  final String recipeName;
  const RecipeDetail({super.key,required this.recipeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(recipeName),
        centerTitle: true,
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),

        ),
      ),
    );
  }
}

