import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './widgets/transaction_list.dart';
import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/chart.dart';
import 'dart:ui';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home: MyHomePage(),
      theme: ThemeData(
          primarySwatch: Colors.purple,
          // errorColor: Colors.red,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                button: TextStyle(color: Colors.white),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  titleLarge: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          )),
      // theme: ThemeData(
      //   textTheme: ThemeData.light().textTheme.copyWith(
      //       headline6: TextStyle(
      //         fontFamily: 'OpenSans',
      //         fontWeight: FontWeight.bold,
      //         fontSize: 20,
      //       ),
      //       headline5: TextStyle(
      //         fontFamily: 'QuickSand',
      //         fontWeight: FontWeight.bold,
      //         fontSize: 18,
      //       ),
      //       button: TextStyle(
      //         fontFamily: 'QuickSand',
      //         fontWeight: FontWeight.bold,
      //         fontSize: 20,
      //       )),
      //   fontFamily: 'Quicksand',
      //   primarySwatch: Colors.blueGrey,
      // ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  // String titleInput;
  // String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _transactions = [
    // Transaction(
    //   title: 'New Shoes',
    //   amount: 1,
    //   id: 'tx1',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   title: 'New Shoes',
    //   amount: 12,
    //   id: 'tx1',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   title: 'New Shoes',
    //   amount: 123,
    //   id: 'tx1',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   title: 'New Shoes',
    //   amount: 1234,
    //   id: 'tx1',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   title: 'New Shoes',
    //   amount: 12345,
    //   id: 'tx1',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   title: 'New Shoes',
    //   amount: 123456,
    //   id: 'tx1',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   title: 'New Shoes',
    //   amount: 1234567,
    //   id: 'tx1',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   title: 'New Shoes',
    //   amount: 12345678,
    //   id: 'tx1',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   title: 'New Shoes',
    //   amount: 123456789,
    //   id: 'tx1',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   title: 'New Shoes',
    //   amount: 1234567890,
    //   id: 'tx1',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   title: 'New Shoes',
    //   amount: 12345678901,
    //   id: 'tx1',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   title: 'New Shoes',
    //   amount: 123456789012,
    //   id: 'tx1',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   title: 'New Shoes',
    //   amount: 1234567890123,
    //   id: 'tx1',
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   title: 'New Book',
    //   amount: 18.88,
    //   id: 'tx2',
    //   date: DateTime.now(),
    // ),
  ];
  List<Transaction> get _recentTransactions {
    return _transactions.where((tx) {
      print(tx.date.isAfter(DateTime.now().subtract(Duration(days: 7))));
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(String txTitle, double txAmount, DateTime selectedDate) {
    setState(() {
      _transactions.add(Transaction(
        title: txTitle,
        amount: txAmount,
        date: selectedDate,
        id: DateTime.now().toString(),
      ));
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tx) => tx.id == id);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            child: NewTransaction(_addTransaction),
            onTap: () {},
            behavior: HitTestBehavior.opaque,
          );
        });
  }

  String _ruppesFormat(double val) {
    print('Ruppes Format Trigger');
    double temp_value = val;
    String temp = temp_value.toStringAsFixed(0);

    if (val < 100) {
      temp = temp_value.toStringAsFixed(0);
      return ' RS ' + temp + ' ';
      // temp = 'RS ' + temp;
    } else if (val < 1000) {
      temp = temp_value.toStringAsFixed(0);
    } else if (val < 100000) {
      temp_value /= 1000;
      temp = temp_value.toStringAsFixed(1) + 'K';
    } else if (val < 10000000) {
      temp_value /= 100000;
      temp = temp_value.toStringAsFixed(1) + 'L';
    } else if (val < 10000000000) {
      temp_value /= 10000000;
      temp = temp_value.toStringAsFixed(1) + 'Cr';
    } else if (val >= 10000000000) {
      temp_value /= 10000000000;
      temp = temp_value.toStringAsFixed(1) + 'K Cr';
    } else {}

    return 'RS ' + temp;
  }

  @override
  Widget build(BuildContext context) {
    var _showChart = false;
    final appBar = AppBar(
      title: Text('Flutter'),
      // backgroundColor: Colors.red[400],
      actions: [
        IconButton(
          onPressed: () => _startAddNewTransaction(context),
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
        )
      ],
    );
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final _txList = Container(
      height: (MediaQuery.of(context).size.height -
              appBar.preferredSize.height -
              MediaQuery.of(context).padding.top) *
          0.7,
      child: TransactionList(_transactions, _ruppesFormat, _deleteTransaction),
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
        // backgroundColor: Colors.red[400],
        actions: [
          IconButton(
            onPressed: () => _startAddNewTransaction(context),
            icon: Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (isLandscape)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Show Chart'),
                  Switch(
                      value: _showChart,
                      onChanged: (val) {
                        print(val);
                        setState(() {
                          _showChart = val;
                        });
                      }),
                ],
              ),
            if (isLandscape)
              _showChart
                  ? Container(
                      height: (MediaQuery.of(context).size.height -
                              appBar.preferredSize.height -
                              MediaQuery.of(context).padding.top) *
                          0.7,
                      child: Chart(_recentTransactions, _ruppesFormat),
                    )
                  : _txList,
            if (!isLandscape)
              Container(
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) *
                    0.3,
                child: Chart(_recentTransactions, _ruppesFormat),
              ),
            if (!isLandscape) _txList,
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
