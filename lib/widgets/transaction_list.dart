import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList({Key? key, required this.transactions}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ListView.builder(
          itemBuilder: (ctx, index) => Card(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 15),
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 2)),
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        '\$${transactions[index].amount.toStringAsFixed(0)}',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple),
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transactions[index].title,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        DateFormat('dd/MM/yyyy')
                            .format(transactions[index].date),
                        style: const TextStyle(color: Colors.grey),
                      )
                    ],
                  )
                ],
              )),
          itemCount: transactions.length),
      // (
      //   children: transactions
      //       .map((tx) => Card(
      //               child: Row(
      //             crossAxisAlignment: CrossAxisAlignment.center,
      //             children: [
      //               Container(
      //                   margin: const EdgeInsets.symmetric(
      //                       vertical: 10, horizontal: 15),
      //                   decoration: BoxDecoration(
      //                       border: Border.all(color: Colors.purple, width: 2)),
      //                   padding: const EdgeInsets.all(10),
      //                   child: Text(
      //                     '\$${tx.amount.toString()}',
      //                     style: const TextStyle(
      //                         fontWeight: FontWeight.bold,
      //                         fontSize: 20,
      //                         color: Colors.purple),
      //                   )),
      //               Column(
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Text(
      //                     tx.title,
      //                     style: const TextStyle(
      //                         fontSize: 16, fontWeight: FontWeight.bold),
      //                   ),
      //                   Text(
      //                     DateFormat('dd/MM/yyyy').format(tx.date),
      //                     style: const TextStyle(color: Colors.grey),
      //                   )
      //                 ],
      //               )
      //             ],
      //           )))
      //       .toList(),
      // ),
    );
  }
}
