import 'package:expense_tracker/model/expense_model.dart';
import 'package:expense_tracker/widgets/expenses_list/expenses_items.dart';
import 'package:flutter/material.dart';

class ExpensesListView extends StatelessWidget {
  const ExpensesListView({
    required this.onRemoveExpense,
    required this.expense,
    super.key,
  });

  final void Function(ExpenseModel expense) onRemoveExpense;
  final List<ExpenseModel> expense;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expense.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expense[index]),
        onDismissed: (direction) => onRemoveExpense(expense[index]),
        child: ExpensesItems(expense: expense[index]),
      ),
    );
  }
}
