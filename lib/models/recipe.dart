import 'package:cooking_book/models/cook_step.dart';
import 'package:cooking_book/models/ingredient.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class Recipe {

  int id;
  String name;
  int person;
  int minutes;

  Recipe({this.id = 0, required this.name, required this.person, required this.minutes});

  final ingredients = ToMany<Ingredient>();
  final steps = ToMany<CookStep>();
}