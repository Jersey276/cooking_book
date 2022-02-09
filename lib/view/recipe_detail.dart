import 'package:cooking_book/models/cook_step.dart';
import 'package:cooking_book/models/ingredient.dart';
import 'package:cooking_book/models/recipe.dart';
import 'package:flutter/material.dart';

class RecipeDetail extends StatefulWidget {
  final Recipe recipe;
  RecipeDetail({Key? key, required this.recipe}) : super(key: key);

  @override
  _RecipeDetailState createState() => _RecipeDetailState();
}

class _RecipeDetailState extends State<RecipeDetail> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Recipe recipe = widget.recipe;
    return Scaffold(
      appBar: AppBar(
        title: Text(recipe.name, textAlign: TextAlign.center),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.post_add))
        ],
      ),
      body: Column(
        children: [
          Image.asset("assets/images/no-image.png"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                child: Row(
                  children : [
                    Icon(Icons.people),
                    Text("${recipe.person} personnes"),
                  ]
                ),
              ),
              Container(
                child: Row(
                    children : [
                      Icon(Icons.access_time),
                      Text("${recipe.minutes} minutes"),
                    ]
                ),
              ),
            ],
          ),
          Expanded(
            child: DefaultTabController(
                length: 2, child: Column(
                children: [
                  TabBar(
                    labelColor: Colors.green,
                    tabs: [
                      Tab(text: "ingrédients",),
                      Tab(text: "étapes",),
                    ],
                  ),
                  Expanded(
                      child: TabBarView(
                      children: [
                        ListView.builder(
                          itemCount: recipe.ingredients.length,
                          itemBuilder: (BuildContext context, int index) {
                            Ingredient ingredient = recipe.ingredients[index];
                            return ListTile(
                              dense: true,
                              title: Text(ingredient.name),
                            );
                          },
                        ),
                        ListView.builder(
                        itemCount: recipe.steps.length,
                        itemBuilder: (BuildContext context, int index) {
                          CookStep step = recipe.steps[index];
                          return ListTile(
                            dense: true,
                            title: Text(step.name),
                          );
                        },
                      ),
                      ]
                    )
                  )
                ],
              ))
          ),
        ],
      ),
    );
  }
}
