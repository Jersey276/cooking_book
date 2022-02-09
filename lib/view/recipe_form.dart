import 'package:cooking_book/global_vars.dart';
import 'package:cooking_book/models/ingredient.dart';
import 'package:cooking_book/models/cook_step.dart';
import 'package:cooking_book/models/recipe.dart';
import 'package:cooking_book/models/recipe_manager.dart';
import 'package:flutter/material.dart';

class RecipeForm extends StatefulWidget {
  Recipe? recipe;

  RecipeForm({Key? key, Recipe? recipe}) : super(key: key);

  @override
  _recipeFormState createState() => _recipeFormState();
}

class _recipeFormState extends State<RecipeForm> with TickerProviderStateMixin {

  late TabController _tabController;
  String? name;
  int? person;
  int? minutes;
  List<Ingredient> ingredients = [
    Ingredient(name: "test", qty: "test")
  ];
  List<CookStep> steps = [
    CookStep(name: "text"),
  ];
  @override
  void initState() {
    if(widget.recipe != null) {
      name = widget.recipe!.name;
      person = widget.recipe!.person;
      minutes = widget.recipe!.minutes;
      ingredients = widget.recipe!.ingredients;
      steps = widget.recipe!.steps;
    }
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  void submit() async {
    if (name != null && person != null && minutes != null) {
      RecipeManager.add(recipe: Recipe(name: name!, person: person!, minutes: minutes!), ingredients: ingredients, steps: steps);
      Navigator.pop(context);
    }
  }

  Future<void> newIngredient() async {
    String? name = "";
    String? qty = "";
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            title: const Text('Ajouter un ingrédient'),
            content: Container(
              height: MediaQuery.of(buildContext).size.height / 5,
              child: Column(
                children: [
                  TextField(
                    controller: TextEditingController(
                    ),
                    decoration: InputDecoration(
                        labelText: 'Nom:',
                    ),
                    onChanged: (String str) {name = str;},
                  ),
                  TextField(
                    controller: TextEditingController(
                    ) ,
                    decoration: InputDecoration(
                        labelText: 'quantité (préciser le type',
                    ),onChanged: (String str) {qty = str;},
                  ),
                ],
              ) ,
            ),
            actions: <Widget>[ElevatedButton(
              onPressed: () {Navigator.pop(buildContext);},
              child: const Text('Annuler'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            ),ElevatedButton(
              onPressed: () {
                if(name != null && qty != null){
                  Ingredient ingredient = Ingredient(name: name!, qty: qty!);
                  setState(() {
                    ingredients.add(ingredient);
                  });
                  Navigator.pop(buildContext);
                }
              },
              child: const Text('Valider'),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
            )
            ],
          );
        }
    );
  }

  Future<void> newStep() async {
    String? name = "";
    await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext buildContext) {
          return AlertDialog(
            title: const Text('Ajouter un ingrédient'),
            content: Container(
              height: MediaQuery.of(buildContext).size.height / 8,
              child: Column(
                children: [
                  TextField(
                    controller: TextEditingController(
                    ),
                    decoration: InputDecoration(
                      labelText: 'Nom:',
                    ),
                    onChanged: (String str) {name = str;},
                  ),
                ],
              ) ,
            ),
            actions: <Widget>[ElevatedButton(
              onPressed: () {Navigator.pop(buildContext);},
              child: const Text('Annuler'),
              style: ElevatedButton.styleFrom(primary: Colors.red),
            ),ElevatedButton(
              onPressed: () {
                if(name != null){
                  CookStep step = CookStep(name: name!);
                  setState(() {
                    steps.add(step);
                  });
                  Navigator.pop(buildContext);
                }
              },
              child: const Text('Valider'),
              style: ElevatedButton.styleFrom(primary: Colors.blue),
            )
            ],
          );
        }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("nouvelle recette"),
        bottom:
        TabBar(
          controller: _tabController,
          tabs: const<Widget>[
            Tab(text: "base"),
            Tab(text: "ingrédients"),
            Tab(text: "étapes"),
          ],
        ),
        actions: [
          TextButton(onPressed: submit, child: Text("valider", style: TextStyle( color: Colors.white),)),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Column (
            children: [
              Card(
                child: Column(
                  children: [
                    Image.asset("assets/images/no-image.png"),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(Icons.camera_alt),
                            onPressed: () {},
                          ),
                          IconButton(
                            icon: Icon(Icons.filter),
                            onPressed: () {},
                          )
                        ]
                    )
                  ],
                ),
              ),
              TextField(
                controller: TextEditingController(
                  text: (name != null)?name!:""
                ),
                decoration: InputDecoration(
                  labelText: "Nom de la recette",
                ),
                onChanged: (String text){
                  setState(() {
                    name = text;
                  });
                },
              ),
              TextField(
                controller: TextEditingController(
                    text: (person != null)? person!.toString():"",
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: "personnes",
                ),
                onChanged: (String text){
                  setState(() {
                    person = int.parse(text);
                  });
                },
              ),
              TextField(
                controller: TextEditingController(
                    text: (minutes != null)?minutes!.toString():""
                ),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  labelText: "temps (minutes)",
                ),
                onChanged: (String text){
                  setState(() {
                    minutes = int.parse(text);
                  });
                },
              ),
            ],
      ),
          Column(
            children: [
              ElevatedButton(onPressed: newIngredient, child: Text("nouvel ingrédient")),
              Expanded(child:
                ListView.builder(
                  itemCount: ingredients.length,
                  itemBuilder: (BuildContext context, int index) {
                    Ingredient ingredient = ingredients[index];
                    return Dismissible(
                      onDismissed: (DismissDirection direction) {
                        setState(() {
                          ingredients.removeAt(index);
                        });
                      },
                      background: Container(
                        color: Colors.red,
                        child: Icon(Icons.delete),
                      ),
                      key: Key(ingredient.name),
                      child: ListTile(
                        title: Text(ingredient.name),
                        subtitle: Text(ingredient.qty),
                      ),
                    );
                  }
              ),
              ),


            ],
          ),
            Column(
              children: [
                ElevatedButton(onPressed: newStep, child: Text("nouvel étape")),
                Expanded(child:
                  ListView.builder(
                    itemCount: steps.length,
                    itemBuilder: (BuildContext context, int index) {
                      CookStep step = steps[index];
                      return Dismissible(
                        onDismissed: (DismissDirection direction) {
                          setState(() {
                            steps.removeAt(index);
                          });
                        },
                        background: Container(
                          color: Colors.red,
                          child: Icon(Icons.delete),
                        ),
                        key: Key(step.name),
                        child: ListTile(
                          title: Text(step.name),
                        ),
                      );
                    }
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
