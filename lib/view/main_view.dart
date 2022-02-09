import 'package:cooking_book/models/recipe.dart';
import 'package:cooking_book/models/recipe_manager.dart';
import 'package:cooking_book/view/recipe_detail.dart';
import 'package:cooking_book/view/recipe_form.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Mon Livre de recette"),
        actions: [
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) {
                return RecipeForm();
              },
            ));
          }, icon: const Icon(Icons.add))
        ],
      ),
      body: StreamBuilder(
        stream: RecipeManager.getAllStream(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
    if (!snapshot.hasData) {
    return Center(child: Text("no data"),);
    } else {
    List<Recipe> recipes = snapshot.data;
    return GridView.builder(
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemCount: recipes.length,
    itemBuilder: (BuildContext context, int index) {
    Recipe recipe = recipes[index];
    return OutlinedButton(
    onPressed: () {
    Navigator.push(context, MaterialPageRoute(
    builder: (BuildContext context) {
    return RecipeDetail(recipe: recipe);
    },
    ));
    },
    child: GridTile(
    header: Text(recipe.name, textAlign: TextAlign.center,),
    child: Image.asset("assets/images/no-image.png"),
    footer: Container(
    padding: EdgeInsets.only(top: 10.0),
    child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    Row(
    children: [
    Icon(Icons.people),
    Text(recipe.minutes.toString())
    ],
    ),
    Row(
    children: [
    Icon(Icons.access_time),
    Text(recipe.person.toString())
    ],
    )
    ]
    ),
    ),
    ),
    );
    }
            );
          }
        }
      ),
    );
  }
}
