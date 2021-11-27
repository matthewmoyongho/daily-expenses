import 'package:daily_expenses/models/transaction.dart';
import 'package:daily_expenses/widgets/chart_bar.dart';
import 'package:daily_expenses/widgets/transactions.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double dayTotalSum = 0.0;
      for (var i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[index].date.month == weekDay.month &&
            recentTransaction[index].date.year == weekDay.year) {
          dayTotalSum += recentTransaction[index].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': dayTotalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupTransactionValues.fold(0.00, (previousValue, element) {
      return previousValue + (element['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      //margin: EdgeInsets.all(15),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: groupTransactionValues.map((e) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  (e['day'] as String),
                  (e['amount'] as double),
                  totalSpending == 0
                      ? 0.0
                      : (e['amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
