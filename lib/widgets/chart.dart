import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import './chartBar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransaction;
  final Function ruppesFormat;
  Chart(this.recentTransaction, this.ruppesFormat);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      // Code that will return the day for all days this week
      final weekDay = DateTime.now().subtract(Duration(days: index));

      // Code that will give the totalAmount of that day only
      var totalSum = 0.0;
      for (int i = 0; i < recentTransaction.length; i++) {
        if (recentTransaction[i].date.day == weekDay.day &&
            recentTransaction[i].date.month == weekDay.month &&
            recentTransaction[i].date.year == weekDay.year) {
          totalSum += recentTransaction[i].amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0, (sum, tx) {
      return sum + (tx['amount'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: groupedTransactionValues.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                  (data['day'] as String),
                  (ruppesFormat(data['amount'])),
                  totalSpending == 0.0
                      ? 0.0
                      : (data['amount'] as double) / totalSpending),
            );
          }).toList(),
        ),
      ),
    );
  }
}
