import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(children: <Widget> [
        _RecipesCard(context),
        _RecipesCard(context),
      ],
      )
    );
  }

  Widget _RecipesCard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0), // se colo el padding para que exista separacion entre los RecipesCard
      child: Container(
          width:MediaQuery.of(context).size.width,
          height: 125,
          child: Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      height: 125,
                      width: 100,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Container(),
                      ),
                    ),
                    SizedBox(width: 26),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center, // se agrego para que se centre la informacion en el medio
                      crossAxisAlignment: CrossAxisAlignment.start,// Siempre de manera horizontal este ubicado al inicio
                      children: <Widget> [
                        Text("Lasgna"),
                        SizedBox(height: 4,), // Se agregaron sizebox en height esto porque estamos usando una columna para dar espacio
                        Container( // Movimos de lugar el container para que la linea naranja divida el nobmre del autor
                          height: 2,
                          width: 75,
                          color: Colors.orange
                        ),
                        Text('Pablo V.'),
                        SizedBox(height: 4,),
                        
                    ],)
                  ],
                ),
              ),
            ),
    );
  }
}