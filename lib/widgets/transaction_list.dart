import 'package:flutter/material.dart';
import 'package:flutter_application_2/widgets/transaction_item.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function ruppesFormat;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.ruppesFormat, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: ((context, constraints) {
            print(constraints.maxHeight);
            print(constraints.maxWidth);
            return Column(
              children: [
                Text(
                  'There is no transactions',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          }))
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                      key: ValueKey(tx.id),
                      transaction: tx,
                      deleteTx: deleteTransaction,
                      ruppesFormat: ruppesFormat,
                    ))
                .toList(),
          );
  }
}
