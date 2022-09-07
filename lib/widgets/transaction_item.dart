import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem(
      {Key? key,
      required this.transaction,
      required this.deleteTx,
      required this.ruppesFormat})
      : super(key: key);

  final Transaction transaction;
  final Function deleteTx;
  final Function ruppesFormat;

  @override
  State<TransactionItem> createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  Color _bgColor = Colors.black; // Dummmy Color

  void initState() {
    const availableColors = [
      Colors.red,
      Colors.greenAccent,
      Colors.blue,
      Colors.purple,
    ];

    _bgColor = availableColors[Random().nextInt(availableColors.length)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: ListTile(
        contentPadding: EdgeInsets.all(10),
        leading: Container(
          width: 75,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(
              // color: Theme.of(context).primaryColor,
              color: _bgColor,
            ),
            borderRadius: BorderRadius.circular(50),
            // color: Theme.of(context).primaryColor,
            color: _bgColor,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FittedBox(
                child: Text(widget.ruppesFormat(widget.transaction.amount))),
          ),
        ),
        title: Text(
          widget.transaction.title.toString(),
          style: Theme.of(context).textTheme.headline5,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(widget.transaction.date),
        ),
        trailing: IconButton(
            onPressed: () => widget.deleteTx(widget.transaction.id),
            icon: Icon(
              Icons.delete,
              color: Theme.of(context).errorColor,
            )),
      ),
    );
  }
}
