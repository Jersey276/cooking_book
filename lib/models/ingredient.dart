import 'package:objectbox/objectbox.dart';

@Entity()
class Ingredient {

  int id;
  String name;
  String qty;

  Ingredient({this.id = 0, required this.name, required this.qty});
}