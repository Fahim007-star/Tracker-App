import 'package:flutter/material.dart';
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
  ];

  @override
  Widget build(Object context) {
    return Scaffold(
      body: Column(children: [Text("The Chart"), Text("Expense List")]),
    );
  }
}
