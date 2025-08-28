import 'package:flutter/material.dart';
import 'package:recipe_book/screens/home_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hola Mundo',
      home: RecipeBook(),
    );
  }
}

//Vamos a utilizar una extension de lo que seria un statelessWidget que por ahora lo tomaremos como una clase dinamica, lo llamaeros
//my app

class RecipeBook extends StatelessWidget {
  const RecipeBook({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Text(
            'Recipe Book', 
            style: TextStyle(color:
             Colors.white)
             ),
          bottom: TabBar(
            isScrollable: true, // ordena de izqueirda a derecha si hay muchas tabs
            indicatorColor: Colors.white,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
            Tab(icon: Icon(Icons.home), text: 'Home',),
          ]),
        ),
        body: TabBarView(children: [HomeScreen()],),
        
      ),
    );
  }
}
