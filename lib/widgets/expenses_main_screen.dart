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

  void _addExpense(ExpenseModel expense) {
    setState(() {
      _registeredexpenses.add(expense);
    });
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => CreateExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _removeexpense(ExpenseModel expense) {
    final expenseindex = _registeredexpenses.indexOf(expense);
    setState(() {
      _registeredexpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Expense Deleted'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
            label: "Undo",
            onPressed: () {
              setState(() {
                _registeredexpenses.insert(expenseindex, expense);
              });
            }),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget maincontent = const Center(
      child: Text("No Expense Found,Add some expenses"),
    );

    if (_registeredexpenses.isNotEmpty) {
      maincontent = ExpensesListView(
          onRemoveExpense: _removeexpense, expense: _registeredexpenses);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Expenses Tracker",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
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
          Expanded(child: maincontent),
        ],
      ),
    );
  }
}
