import 'package:flutter/material.dart';
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
    return transactions.isEmpty
        ? Column(
            children: [
              Text(
                "No data",
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                  height: 200,
                  child: Image.asset('assets/images/nodata-found.png'))
            ],
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                        child: Text(
                          '\$${transactions[index].amount}',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                  subtitle:
                      Text(DateFormat.yMMMd().format(transactions[index].date)),
                  trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () =>
                          deleteTransaction(transactions[index].id)),
                ),
              );
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
