import 'package:isar/isar.dart';

part "wallet.g.dart";


@collection
class Income {
  Id id = Isar.autoIncrement;

  String? name;

  String? note;

  double amount = 0;

  String? source;

  int? category = 0;
}

/* @collection
class Income {
  Id id = Isar.autoIncrement;

  String? income_title;

  String? income_note;

  double income_amount = 0;

  String? income_source;

  final expenditure = IsarLink<Expenditure>();

  final category = IsarLink<Category>();
} */

/* @collection
class Expenditure {
  Id id = Isar.autoIncrement;

  String? expenditure_title;

  String? expenditure_note;

  double expenditure_amount = 0;

  String? expenditure_source;

  final category = IsarLink<Category>();
} */

@collection
class Category {
  Id id = Isar.autoIncrement;

  String? categoryName;

  int order = 0;
}
