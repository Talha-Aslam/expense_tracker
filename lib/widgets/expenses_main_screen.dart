import 'package:expense_tracker/widgets/expenses_list/create_expense.dart';
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

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
        context: context, builder: (ctx) => const CreateExpense());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expenses Tracker",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromARGB(255, 150, 116, 193),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text("this is chart"),
          Expanded(child: ExpensesListView(expense: _registeredexpenses)),
        ],
      ),
    );
  }
}
