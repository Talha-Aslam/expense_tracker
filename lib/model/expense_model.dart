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

class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<ExpenseModel> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<ExpenseModel> expenses;

  double get totalExpenses {
    double sum = 0;
    for (final x in expenses) {
      sum += x.amount;
    }
    return sum;
  }
}
