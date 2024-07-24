import 'package:expense_tracker/widgets/chart/chart.dart';
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
  final List<ExpenseModel> _registeredexpenses = [];

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
      child: Text("No Expense Found ¯\\(◉◡◔)/¯,Add some expenses"),
    );

    if (_registeredexpenses.isNotEmpty) {
      maincontent = ExpensesListView(
          onRemoveExpense: _removeexpense, expense: _registeredexpenses);
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 224, 114, 41),
        title: const Text(
          "Expenses  Tracker",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 3,
              color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            hoverColor: Colors.grey,
            enableFeedback: true,
            icon: const Icon(
              Icons.add,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredexpenses),
          Expanded(child: maincontent),
        ],
      ),
    );
  }
}
