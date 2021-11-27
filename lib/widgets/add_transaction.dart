import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransaction extends StatefulWidget {
  Function(String, double, DateTime) _txFunction;
  AddTransaction(this._txFunction);

  @override
  State<AddTransaction> createState() => _AddTransactionState();
}

class _AddTransactionState extends State<AddTransaction> {
  TextEditingController txTitleController = TextEditingController();

  TextEditingController txAmountController = TextEditingController();
  DateTime? pickedDate;

  void _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        pickedDate = value;
      });
    });
  }

  void submitAction() {
    final enteredTitle = txTitleController.text;
    final enteredAmount = double.parse(txAmountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0|| pickedDate ==null) {
      return;
    }

    widget._txFunction(enteredTitle, enteredAmount, pickedDate!);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              controller: txTitleController,
              decoration: InputDecoration(label: Text('Title')),
              onSubmitted: (_) => submitAction(),
            ),
            TextField(
              controller: txAmountController,
              decoration: InputDecoration(label: Text('Amount')),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitAction(),
            ),
            Row(
              children: [
                Text(pickedDate == null
                    ? 'No date chosen!'
                    : 'Picked date: ${DateFormat.yMMMd().format(pickedDate!)}'),
                TextButton(
                    onPressed: _showDatePicker, child: Text('Choose date'))
              ],
            ),
            ElevatedButton(
              onPressed: submitAction,
              child: Text(
                'Add Transaction',
              ),
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).primaryColor,
                  onPrimary: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
