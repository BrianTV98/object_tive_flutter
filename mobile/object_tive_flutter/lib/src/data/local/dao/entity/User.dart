import 'package:floor/floor.dart';

@entity
class User{
  @primaryKey
  final int id;

  final String name;

  User(this.id, this.name);
}