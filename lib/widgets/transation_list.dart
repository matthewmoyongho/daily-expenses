import '../models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  List transactions;
  Function deleteTransaction;
  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.6,
        child: transactions.isEmpty
            ? Column(
                children: [
                  Text(
                    'No transaction has been added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      child: Image.asset('assets/images/waiting.png',
                          fit: BoxFit.cover))
                ],
              )
            : ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 5,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: FittedBox(
                              child: Text(
                                  '${transactions[index].amount.toStringAsFixed(2)}'),
                            ),
                          ),
                        ),
                        title: Text(
                          '${transactions[index].title}',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        subtitle: Text(
                            '${DateFormat.yMMMd().format(transactions[index].date)}'),
                        trailing: IconButton(
                            onPressed: () =>
                                deleteTransaction(transactions[index].id),
                            icon: Icon(Icons.delete,
                                color: Theme.of(context).errorColor)),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
