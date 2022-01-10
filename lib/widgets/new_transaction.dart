import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;
  NewTransaction({Key? key, required this.addNewTransaction}) : super(key: key);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amoutController = TextEditingController();
  DateTime? _selectDate;

  void _submitData() {
    if (_amoutController.text.isEmpty) {
      return;
    }
    final enteredTitle = _titleController.text;
    final enteredAmount = _amoutController.text;
    if (enteredTitle.isEmpty ||
        double.parse(enteredAmount) <= 0 ||
        _selectDate == null) {
      return;
    }
    widget.addNewTransaction(
        _titleController.text, double.parse(enteredAmount), _selectDate);
    Navigator.of(context).pop();
  }

  void _presentDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2019),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectDate = value;
      });
    });
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
              controller: _titleController,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amout'),
              controller: _amoutController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text(
                    _selectDate == null
                        ? 'No Date Chosen!'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectDate!)}',
                    style: TextStyle(fontSize: 14),
                  ),
                  TextButton(
                      onPressed: _presentDatePicker,
                      // textColor: Theme.of(context).primaryColor,
                      child: const Text(
                        'Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ))
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
            ),
            TextButton(
                onPressed: _submitData,
                child: const Text('Add Transaction'),
                style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    primary: Theme.of(context).textTheme.button?.color))
          ],
        ),
      ),
    );
  }
}
