import 'package:flutter/material.dart';
import '../helper_functions.dart';
import 'package:recipe_book/screens/recipe_detail.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: <Widget> [
        _recipesCard(context,title: 'Lasgna', author: 'By PVH', imagePath: 'assets/images/lasagna.jpg',),
        _recipesCard(context,title: 'Tacos al pastor', author: 'By PVH', imagePath: 'assets/images/tacospastor.jpeg',), 
        _recipesCard(context,title: 'Quesabirria', author: 'By PVH', imagePath: 'https://s3.amazonaws.com/static.realcaliforniamilk.com/media/recipes_2/Quesabirria_Tacos.jpg',), 
        _recipesCard(context,title: 'Enchiladas verdes', author: 'By PVH', imagePath: 'assets/images/enchiladasverdes.jpg',),
        _recipesCard(context,title: 'Chiles en nogada', author: 'By PVH', imagePath: 'https:////s3.amazonaws.com/static.realcaliforniamilk.com/media/recipes_2/Quesabirria.jpg',),
      ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: Icon(Icons.add,color:Colors.white,),
        onPressed: () {
          _showBottom(context);
          // showCustomBottomSheet(
          //   context: context,
          //   child: RecipeForm(),
          // );
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
            // 🔥 quitar height fijo
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom, // se adapta al teclado
            ),
            child: Container(
              color: Colors.white,
              padding: EdgeInsets.all(16), // mantiene tu padding interno
              child: RecipeForm(),
            ),
          );
        },
      );
    },
  );
}


  Widget _recipesCard(BuildContext context,{ required String title,
  required String author,
   String imagePath = '',}) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const RecipeDetail(recipeName: 'Lasagna',)));
      },
      child: Padding(
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
      ),
    );
  }
}


class RecipeForm extends StatelessWidget {
  const RecipeForm({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>(); // Se agrega FormState para que sepa que va guardar el estado del formulario
    
    final TextEditingController recipeNameController = TextEditingController();
    final TextEditingController authorController = TextEditingController();
    final TextEditingController imagePathController = TextEditingController();
    final TextEditingController recipeController = TextEditingController();
    
    return Padding(
      padding: EdgeInsets.all(8),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Add New Recipe',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              _buildTextField(controller:recipeNameController,label: 'Recipe Name',isRequired: true,), // 🔥 marca este campo como obligatorio
              SizedBox(height: 12),
              _buildTextField(controller:authorController,label: 'Author',isRequired: true,),
              SizedBox(height: 12),
              _buildTextField(controller:imagePathController,label: 'Image URL or Path',),
              SizedBox(height: 12),
              _buildTextField(controller:recipeController,label: 'Recipe',isRequired: true,),
              SizedBox(height: 16),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState != null &&
                        formKey.currentState!.validate()) {
                      // Aquí puedes manejar el envío del formulario
                      Navigator.pop(context);
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    'Submit Recipe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// Ejemplo de Elevated Button centrado
              // Center(
              //   child: ElevatedButton(
              //     style: ElevatedButton.styleFrom(
              //       backgroundColor: Colors.orange,
              //     ),
              //     onPressed: () {
              //       if (_formKey.currentState!.validate()) {
              //         // Aquí puedes manejar el envío del formulario
              //         Navigator.pop(context); // Cierra el modal
              //       }
              //     },
              //     child: Text('Submit', style: TextStyle(color: Colors.white)),
              //   ),
              // )


Widget _buildTextField({
  required String label,
  required TextEditingController controller,
  bool isRequired = false, // 🔥 bandera para marcar si es obligatorio
  int maxLines = 1,
  String? Function(String?)? validator, // opcional
}) {
  return TextFormField(
    controller: controller,
     validator: validator ?? (value) { // usa el custom si lo mandan, si no usa este
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
    maxLines: maxLines,
  );
}

}