import 'package:expense_tracker/widgets/expenses_list/expenses_list_view.dart';
import 'package:expense_tracker/model/expense_model.dart';
import 'package:flutter/material.dart';

class ExpensesMainScreen extends StatefulWidget {
  const ExpensesMainScreen({super.key});
  @override
  State<ExpensesMainScreen> createState() {
    return _ExpensesMainScreen();
  }
}

class _ExpensesMainScreen extends State<ExpensesMainScreen> {
  final List<ExpenseModel> _registeredexpenses = [
    ExpenseModel(
      title: "Flutter Course",
      amount: 10000,
      date: DateTime.now(),
      category: Category.work,
    ),
    ExpenseModel(
      title: "Burger",
      amount: 1000,
      date: DateTime.now(),
      category: Category.food,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Text("this is chart"),
          Expanded(child: ExpensesListView(expense: _registeredexpenses)),
        ],
      ),
    );
  }
}
