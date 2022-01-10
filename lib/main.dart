import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_complete_guide/splash.dart';
import 'package:flutter_complete_guide/widgets/chart.dart';
import 'package:flutter_complete_guide/widgets/new_transaction.dart';
import 'package:flutter_complete_guide/widgets/transaction_list.dart';

import 'package:intl/intl.dart';
import 'models/transaction.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = ThemeData();
    return MaterialApp(
      title: 'Flutter App',
      // theme: ThemeData(
      //     primarySwatch: Colors.green,
      //     accentColor: Colors.red,
      //     fontFamily: 'Quicksand',
      //     appBarTheme: AppBarTheme(
      //       textTheme: const TextTheme(
      //         headline6: TextStyle(
      //           fontFamily: 'Quicksand',
      //           fontSize: 50,
      //           fontWeight: FontWeight.bold,
      //         ),
      //       ),
      //     )),
      theme: ThemeData(
          // colorScheme: theme.colorScheme.copyWith(secondary: Colors.red),
          primaryColor: Colors.red,
          fontFamily: 'Quicksand',
          colorScheme: theme.colorScheme
              .copyWith(secondary: Colors.red, primary: Colors.red[400]),
          errorColor: Colors.red[700],
          textTheme: const TextTheme(
              button: TextStyle(color: Colors.white),
              bodyText2: TextStyle(
                  fontFamily: "Merriweather",
                  fontSize: 20,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.bold),
              headline6: TextStyle(
                  fontFamily: "Merriweather",
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
      home: Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final titleController = TextEditingController();

  final amoutController = TextEditingController();
  final List<Transaction> _userTransactions = [
    // Transaction(
    //     id: 't1', title: "New Shoes", amount: 69.99, date: DateTime.now()),
    // Transaction(
    //     id: 'tư', title: "Weekly Shoes", amount: 161.53, date: DateTime.now()),
  ];
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addNewTransaction(String txTitle, double txAmout, DateTime date) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        amount: txAmout,
        date: date);
    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {
            print("aaaaa");
          },
          child: NewTransaction(addNewTransaction: _addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final appbar = AppBar(
      title: const Text("Flutter App"),
      actions: [
        IconButton(
            onPressed: () {
              startAddNewTransaction(context);
            },
            icon: Icon(Icons.add))
      ],
    );
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
              height: (MediaQuery.of(context).size.height -
                      appbar.preferredSize.height -
                      MediaQuery.of(context).padding.top) *
                  0.3,
              child: Chart(recentTransactions: _recentTransactions)),
          Container(
            height: (MediaQuery.of(context).size.height -
                    appbar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.7,
            child: TransactionList(
                transactions: _userTransactions,
                deleteTransaction: _deleteTransaction),
          ),
        ],
      )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          startAddNewTransaction(context);
        },
      ),
    );
  }
}
