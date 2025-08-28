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
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.add,color:Colors.white,),
        onPressed: () {
          _showBottom(context);
        },),
    );
  }

Future<void> _showBottom(BuildContext context) async {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.white,
          child: RecipeForm(),
        );
      },
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


class RecipeForm extends StatelessWidget {
  const RecipeForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(8) ,
    child: Form(
      //key: _formKey,
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Add New Recipe',
           style: TextStyle(
            fontSize: 24, 
            fontWeight: FontWeight.bold),),
          SizedBox(height: 16,),
          _buildTextField(label:  'Recipe Name'),
        ],

      ),
      )
      );
  }

  // Widget _buildTextField(){  // ejemplo de un TextField con validacion
  //   return TextFormField(
  //     decoration: InputDecoration(
  //       labelText: 'Recipe Name',
  //       border: OutlineInputBorder(),
  //     ),
  //     validator: (value){
  //       if(value == null || value.isEmpty){
  //         return 'Please enter some text';
  //       }
  //       return null;
  //     },
  //   );
  // }

  // TextField del curso

  Widget _buildTextField({required String label}){
    return TextFormField(
      decoration: InputDecoration(
        labelText: label ,
        labelStyle: TextStyle(
          fontFamily: 'Quicksan',
          fontSize: 16,
          color: Colors.orange,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10),),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange),
          borderRadius: BorderRadius.circular(  10),
        )
      ),
    );
  }

}