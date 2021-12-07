import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;
  NewTransaction({Key? key, required this.addNewTransaction}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amoutController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = amoutController.text;
    if (enteredTitle.isEmpty || double.parse(enteredAmount) <= 0) {
      return;
    }
    widget.addNewTransaction(titleController.text, double.parse(enteredAmount));
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amout'),
              controller: amoutController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            TextButton(
                onPressed: submitData,
                child: const Text('Add Transaction'),
                style: TextButton.styleFrom(
                  primary: Colors.purple,
                ))
          ],
        ),
      ),
    );
  }
}
