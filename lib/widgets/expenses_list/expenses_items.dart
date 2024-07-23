import "package:expense_tracker/model/expense_model.dart";
import "package:flutter/material.dart";

class ExpensesItems extends StatelessWidget {
  const ExpensesItems({required this.expense, super.key});

  final ExpenseModel expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          children: [
            Text(expense.title),
            const SizedBox(height: 10),
            Row(
              children: [
                Text('\$${expense.amount.toStringAsFixed(2)}'),
                const Spacer(),
                Row(
                  children: [
                    Icon(
                      categoryIcons[expense.category],
                    ),
                    const SizedBox(width: 5),
                    Text(
                      expense.formatedate,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
