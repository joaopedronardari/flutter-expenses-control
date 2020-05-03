import 'package:flutter/material.dart';
import 'package:flutter_expenses_control/widgets/chart.dart';
import './models/transaction.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expenses Control',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.amber,
        fontFamily: 'QuickSand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontSize: 20,
                ),
              ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    /*Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 180.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Groceries',
      amount: 400.0,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't3',
      title: 'Udemy Course',
      amount: 25.5,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Medicine',
      amount: 70.5,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Medicine',
      amount: 70.5,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Medicine',
      amount: 70.5,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Medicine',
      amount: 70.5,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Medicine',
      amount: 70.5,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Medicine',
      amount: 70.5,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Medicine',
      amount: 70.5,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't4',
      title: 'Medicine',
      amount: 70.5,
      date: DateTime.now(),
    ),*/
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((transaction) {
      return transaction.date.isAfter(DateTime.now().subtract(Duration(
        days: 7,
      )));
    }).toList();
  }

  void _addTransaction(String txTitle, double txAmount) {
    final newTx = Transaction(
      id: DateTime.now().toString(),
      title: txTitle,
      amount: txAmount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _showNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return NewTransaction(_addTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses Control'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _showNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _showNewTransaction(context),
      ),
    );
  }
}
