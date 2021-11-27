import 'package:daily_expenses/models/transaction.dart';
import 'package:daily_expenses/widgets/add_transaction.dart';
import 'package:daily_expenses/widgets/chart.dart';
import 'package:daily_expenses/widgets/transation_list.dart';

import '../widgets/transactions.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Transaction> transactions = [
    // Transaction(
    //     amount: 99.3, date: DateTime.now(), id: '1', title: "New shoes"),
    // Transaction(amount: 34.3, date: DateTime.now(), id: '2', title: "Books"),
    // Transaction(amount: 20.45, date: DateTime.now(), id: '3', title: "Biro"),
  ];

  void _txFunction(String txTitle, double txAmount, DateTime date) {
    final transation = Transaction(
        amount: txAmount,
        date: date,
        id: DateTime.now().toString(),
        title: txTitle);

    setState(() {
      transactions.add(transation);
    });
  }

  _addTransactionPage(BuildContext ctx) {
    return showModalBottomSheet(
        context: context,
        builder: (_) {
          return GestureDetector(child: AddTransaction(_txFunction));
        });
  }

  List<Transaction> get _recentTransaction {
    return transactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _deleteTransaction(id) {
    setState(() {
      transactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addTransactionPage(context),
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => _addTransactionPage(context),
            icon: Icon(Icons.add),
          ),
        ],
        title: Text('Home'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Chart(_recentTransaction),
                TransactionList(transactions,_deleteTransaction),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
