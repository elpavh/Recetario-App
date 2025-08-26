import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,title: 'Hola Mundo', 
    home:RecipeBook() );
  }
}

//Vamos a utilizar una extension de lo que seria un statelessWidget que por ahora lo tomaremos como una clase dinamica, lo llamaeros
//my app 

class RecipeBook extends StatelessWidget {
  const RecipeBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          'Recipe Book',
          style: TextStyle(color: Colors.white,
          ),
          ),
          ),
          body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80'),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                'Welcome to the Recipe Book',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  backgroundColor: Colors.black45,
                ),
              ),
            ),
          ),
          );
  }
}