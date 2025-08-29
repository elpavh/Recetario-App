import 'package:flutter/material.dart';
import '../helper_functions.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget> [
        _RecipesCard(context,title: 'Lasgna', author: 'By PVH', imagePath: 'assets/images/lasagna.jpg',),
        _RecipesCard(context,title: 'Tacos al pastor', author: 'By PVH', imagePath: 'assets/images/tacospastor.jpeg',), 
        _RecipesCard(context,title: 'Quesabirria', author: 'By PVH', imagePath: 'https://s3.amazonaws.com/static.realcaliforniamilk.com/media/recipes_2/Quesabirria_Tacos.jpg',), 
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
    isScrollControlled: true, // 🔥 para que crezca con el teclado
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
        expand: false,
        builder: (context, scrollController) {
          return SingleChildScrollView(
            controller: scrollController,
            child: Container( 
            height: MediaQuery.of(context).size.height * 0.6, // 60% de la pantalla
            color:Colors.white,
            child: RecipeForm(),
            ),
          ); // ✅ aquí va el ;
        },
      );
    },
  );
}


  Widget _RecipesCard(BuildContext context,{ required String title,
  required String author,
  required String imagePath,}) {
    return Padding(
      padding: const EdgeInsets.all(8.0), 
      child: SizedBox(
          width:MediaQuery.of(context).size.width,
          height: 125,
          child: Card(
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      height: 125,
                      width: 100,
                      child: ClipRRect( 
                        borderRadius: BorderRadius.only( 
                          topLeft: Radius.circular(12),
                          bottomLeft: Radius.circular(12)
                        ),
                        child: displayImage(imagePath),
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
    final _formKey = GlobalKey<FormState>(); // Se agrega FormState para que sepa que va guardar el estado del formulario
    
    final TextEditingController _recipeNameController = TextEditingController();
    final TextEditingController _authorController = TextEditingController();
    final TextEditingController _imagePathController = TextEditingController();
    final TextEditingController _recipeController = TextEditingController();
    
    return Padding(
      padding: EdgeInsets.all(8),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add New Recipe',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildTextField(controller:_recipeNameController,label: 'Recipe Name',isRequired: true,), // 🔥 marca este campo como obligatorio
              SizedBox(height: 12),
              _buildTextField(controller:_authorController,label: 'Author',isRequired: true,),
              SizedBox(height: 12),
              _buildTextField(controller:_imagePathController,label: 'Image URL or Path',isRequired: true,),
              SizedBox(height: 12),
              _buildTextField(controller:_recipeController,label: 'Recipe',isRequired: true,),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
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
Widget _buildTextField({
  required String label,
  required TextEditingController controller,
  bool isRequired = false, // 🔥 bandera para marcar si es obligatorio
}) {
  return TextFormField(
    controller: controller,
    validator: (value) {
      if (isRequired && (value == null || value.isEmpty)) {
        return 'Please enter $label'; // usa el label como mensaje
      }
      return null;
    },
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(
        fontFamily: 'Quicksan',
        fontSize: 16,
        color: Colors.orange,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.orange),
        borderRadius: BorderRadius.circular(10),
      ),
    ),
  );
}

}