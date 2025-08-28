import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget> [
        _RecipesCard(context,title: 'Lasgna', author: 'By PVH', imagePath: 'assets/images/lasagna.jpg',),
        _RecipesCard(context,title: 'Tacos al pastor', author: 'By PVH', imagePath: 'assets/images/tacospastor.jpeg',), 
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


  Widget _RecipesCard(BuildContext context,{ required String title,
  required String author,
  required String imagePath,}) {
    return Padding(
      padding: const EdgeInsets.all(8.0), 
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
                        borderRadius: BorderRadius.only( 
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12)
                        ),
                        child: Image.asset(imagePath, fit: BoxFit.cover),
                      ),
                    ),
                    SizedBox(width: 26),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget> [
                        Text(title, style: TextStyle(fontSize: 16,fontFamily: 'Quicksan',fontWeight: FontWeight.bold)),
                        SizedBox(height: 4,), 
                        Container( 
                          height: 2,
                          width: 75,
                          color: Colors.orange
                        ),
                        Text(author, style: TextStyle(fontSize: 16,fontFamily: 'Quicksan')), 
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