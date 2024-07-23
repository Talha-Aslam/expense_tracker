import 'package:flutter/material.dart';
import 'package:expense_tracker/model/expense_model.dart';

class CreateExpense extends StatefulWidget {
  const CreateExpense({super.key});

  @override
  State<CreateExpense> createState() {
    return _CreateExpenseState();
  }
}

class _CreateExpenseState extends State<CreateExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category selectedCategory = Category.food;

  void _presentDatePicker() async {
    final dateNow = DateTime.now();
    final firstDate = DateTime(dateNow.year - 1);
    final pickedDate = await showDatePicker(
        context: context, firstDate: firstDate, lastDate: dateNow);
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredamount = double.tryParse(_amountController.text);

    final amountIsInvalid = enteredamount == null || enteredamount <= 0;

    if (_titleController.text.trim().isEmpty ||
        _selectedDate == null ||
        amountIsInvalid) {
      return;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text("Title"),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    label: Text("Amount"),
                    prefixText: '\$ ',
                  ),
                  keyboardType: TextInputType.number,
                  controller: _amountController,
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _selectedDate == null
                          ? "No Date Selected"
                          : formater.format(_selectedDate!),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(
                        Icons.calendar_month_sharp,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              DropdownButton(
                value: selectedCategory,
                icon: const Icon(Icons.arrow_drop_down_circle_outlined),
                items: Category.values.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category.name.toUpperCase()),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value as Category;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancle"),
              ),
              const SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: const Text("Save"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
