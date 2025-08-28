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
                      child: ClipRRect( // se agrego ClipRRect para que la imagen tenga las esquinas redondeadas
                        borderRadius: BorderRadius.only( 
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12)
                        ),
                        child: Image.asset('assets/images/lasagna.jpg', fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 26),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        Text("Lasgna", style: TextStyle(fontSize: 16,fontFamily: 'Quicksan',fontWeight: FontWeight.bold)),
                        SizedBox(height: 4,), 
                        Container( 
                          height: 2,
                          width: 75,
                          color: Colors.orange
                        ),
                        Text('Pablo V.', style: TextStyle(fontSize: 16,fontFamily: 'Quicksan')), 
                        SizedBox(height: 4,),
                        
                    ],)
                  ],
                ),
              ),
            ),
    );
  }
}