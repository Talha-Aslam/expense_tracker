import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formater = DateFormat.yMd();

enum Category { food, leisure, work, travel }

const categoryIcons = {
  Category.food: Icons.dining_outlined,
  Category.leisure: Icons.local_activity_outlined,
  Category.work: Icons.work_outline,
  Category.travel: Icons.flight_outlined,
};

class ExpenseModel {
  ExpenseModel({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  get formatedate {
    return formater.format(date);
  }
}
