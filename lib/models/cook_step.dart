import 'package:objectbox/objectbox.dart';

@Entity()
class CookStep {

  int id;
  String name;

  CookStep({this.id = 0, required this.name});
}