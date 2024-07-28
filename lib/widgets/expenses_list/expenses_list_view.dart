import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_items.dart';
import 'package:flutter/material.dart';

class ExpensesListView extends StatelessWidget {
  const ExpensesListView(
      {required this.onRemoveExpense, required this.expense, super.key});

  final void Function(ExpenseModel expense) onRemoveExpense;
  final List<ExpenseModel> expense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (context, index) => Dismissible(
        background: Container(
          padding: const EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(255, 240, 84, 72),
          ),
          margin: const EdgeInsets.symmetric(vertical: 13),
          child: const Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.delete_forever_outlined,
              color: Colors.white,
              size: 40,
            ),
          ),
        ),
        key: ValueKey(expense[index]),
        onDismissed: (direction) => onRemoveExpense(expense[index]),
        child: ExpensesItems(expense: expense[index]),
      ),
    );
  }
}
