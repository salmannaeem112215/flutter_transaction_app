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
        textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
            headline5: TextStyle(
              fontFamily: 'QuickSand',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
            button: TextStyle(
              fontFamily: 'QuickSand',
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
        fontFamily: 'Quicksand',
        primarySwatch: Colors.blueGrey,
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                titleLarge: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with WidgetsBindingObserver {
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

  bool _showChart = false;
  //AppLifeCycle listner adding
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  // due to appLifeCycle listner is added when ever the state change it will be called
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
    super.didChangeAppLifecycleState(state);
  }

  //AppLifeCycle listner removing
  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
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

  List<Widget> _buildLandscapeContent(
      MediaQueryData mediaQuery, AppBar appBar, Widget txWidgetList) {
    return [
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
      _showChart
          ? Container(
              height: (mediaQuery.size.height -
                      appBar.preferredSize.height -
                      mediaQuery.padding.top) *
                  0.7,
              child: Chart(_recentTransactions, _ruppesFormat),
            )
          : txWidgetList,
    ];
  }

  List<Widget> _buildPortraitContent(
      MediaQueryData mediaQuery, AppBar appBar, Widget txWidgetList) {
    return [
      Container(
        height: (mediaQuery.size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.3,
        child: Chart(_recentTransactions, _ruppesFormat),
      ),
      txWidgetList
    ];
  }

  @override
  Widget build(BuildContext context) {
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
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final _txList = Container(
      height: (mediaQuery.size.height -
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
              ..._buildLandscapeContent(mediaQuery, appBar, _txList),
            if (!isLandscape)
              ..._buildPortraitContent(mediaQuery, appBar, _txList),
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
