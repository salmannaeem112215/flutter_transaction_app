import 'package:flutter/material.dart';
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
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  leading: Container(
                    width: 75,
                    height: 50,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).primaryColor,
                        ),
                        borderRadius: BorderRadius.circular(50),
                        color: Theme.of(context).primaryColor),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                          child:
                              Text(ruppesFormat(transactions[index].amount))),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                  ),
                  trailing: IconButton(
                      onPressed: () =>
                          deleteTransaction(transactions[index].id),
                      icon: Icon(
                        Icons.delete,
                        color: Theme.of(context).errorColor,
                      )),
                ),
              );
            },
            itemCount: transactions.length,
          );
  }
}
