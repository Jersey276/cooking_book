import 'dart:async';

import 'package:cooking_book/global_vars.dart';
import 'package:cooking_book/models/cook_step.dart';
import 'package:cooking_book/models/ingredient.dart';
import 'package:cooking_book/models/recipe.dart';
import 'package:cooking_book/objectbox.g.dart';

class RecipeManager{

  static Stream<List<Recipe>> getAllStream(){
    StreamController<List<Recipe>> controller = StreamController<List<Recipe>>();
    if(GlobalVars.store != null){
      Stream<List<Recipe>> _streamRecipe =
      GlobalVars.store!.box<Recipe>().query().watch(triggerImmediately: true).map((query) => query.find());
      controller.addStream(_streamRecipe);
    }
    return controller.stream;
  }

  static bool add({required Recipe recipe, required List<Ingredient> ingredients, required List<CookStep> steps}) {
    for (var ingredient in ingredients) {
      recipe.ingredients.add(ingredient);
    }
    for (var step in steps) {
      recipe.steps.add(step);
    }
    int result = GlobalVars.store!.box<Recipe>().put(recipe);
    return true;
  }

  static bool remove({required Recipe recipe}) {
    for (Ingredient ingredient in recipe.ingredients) {
      recipe.ingredients.remove(ingredient);
      GlobalVars.store!.box<Ingredient>().remove(ingredient.id);
    }
    for (CookStep step in recipe.steps) {
      recipe.steps.remove(step);
      GlobalVars.store!.box<Ingredient>().remove(step.id);
    }

    return GlobalVars.store!.box<Recipe>().remove(recipe.id);
  }
}