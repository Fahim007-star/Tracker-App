import 'package:flutter/material.dart';
import 'package:tracker_app/widgets/expenses%20list/expenses_list.dart';
import 'package:tracker_app/models/expense.dart';
import 'package:tracker_app/widgets/expenses%20list/new_expenses.dart';

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
  ];
  void _openAddExpensesOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return NewExpenses(onAddExpense: _addExpenses);
      },
    );
  }

  void _addExpenses(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        content: Text('Expenses Deleted'),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(Object context) {
    Widget mainContent = Center(
      child: Text("No Expenses found. Start adding some!"),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Flutter Expense Track",
          style: TextStyle(color: Colors.black),
        ),

        actions: [
          IconButton(onPressed: _openAddExpensesOverlay, icon: Icon(Icons.add)),
        ],
      ),
      body: Column(
        children: [
          Text("The Chart"),

          Expanded(child: mainContent),
        ],
      ),
    );
  }
}
