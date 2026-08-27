import 'package:flutter/material.dart';
import 'package:tracker_app/widgets/expenses%20list/expenses_list.dart';
import 'package:tracker_app/models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      amount: 19.20,
      date: DateTime.now(),
      title: "Flutter Course",
      category: Category.work,
    ),
    Expense(
      amount: 50.20,
      date: DateTime.now(),
      title: "Cinema",
      category: Category.leisure,
    ),
    Expense(
      amount: 50.20,
      date: DateTime.now(),
      title: "Dhaka",
      category: Category.travel,
    ),
  ];

  @override
  Widget build(Object context) {
    return Scaffold(
      body: Column(
        children: [
          Text("The Chart"),
          Text("Expense List"),
          Expanded(child: ExpensesList(expenses: _registeredExpenses)),
        ],
      ),
    );
  }
}
