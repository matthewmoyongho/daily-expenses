import 'package:daily_expenses/widgets/add_transaction.dart';
import 'package:daily_expenses/widgets/transation_list.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  

  @override
  Widget build(BuildContext context) {
    return Column(
    //     children: [
    //       AddTransaction(_txFunction),
    //       TransactionList(transactions),
    //     ],
    // Card(
    //                 child: Row(
    //                   children: [
    //                     Container(
    //                       child: Text(
    //                         '\$${transactions[index].amount.toStringAsFixed(2)}',
    //                         style: TextStyle(
    //                             color: Theme.of(context).primaryColor),
    //                       ),
    //                       decoration: BoxDecoration(
    //                         border: Border.all(
    //                             color: Theme.of(context).primaryColor,
    //                             width: 2),
    //                       ),
    //                       padding: EdgeInsets.all(10),
    //                     ),
    //                     SizedBox(
    //                       width: 10,
    //                     ),
    //                     Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         Text(
    //                           '${transactions[index].title}',
    //                           style: Theme.of(context).textTheme.headline6,
    //                         ),
    //                         Text(
    //                           '${DateFormat.yMMMMd().format(transactions[index].date)}',
    //                           style: TextStyle(color: Colors.grey),
    //                         ),
    //                       ],
    //                     )
    //                   ],
    //                 ),
    //               )
      
    );
  }
}
