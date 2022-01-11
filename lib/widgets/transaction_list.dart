import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/transaction_item.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(
      {Key? key, required this.transactions, required this.deleteTransaction})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    print('build() TransactionList');
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constraint) {
            return Column(
              children: [
                Text(
                  "No data",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: constraint.maxHeight * 0.05,
                ),
                Container(
                    height: constraint.maxHeight * 0.7,
                    child: Image.asset('assets/images/nodata-found.png'))
              ],
            );
          })
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(
                  transaction: transactions[index],
                  deleteTx: deleteTransaction);
            },
            itemCount: transactions.length);
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
  }
}
