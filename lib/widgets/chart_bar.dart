import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String label;
  final double dayAmount;
  final double percentageOfSpending;

  ChartBar(this.label, this.dayAmount, this.percentageOfSpending);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 20,
          child: FittedBox(
            child: Text('\$${dayAmount.toStringAsFixed(0)}'),
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Container(
          height: 70,
          width: 10,
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromRGBO(220, 220, 220, 1),
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentageOfSpending,
                child: Container(
                  color: Theme.of(context).primaryColor,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 4,
        ),
        Text('$label')
      ],
    );
  }
}
