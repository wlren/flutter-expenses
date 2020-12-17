import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransaction;

  NewTransaction(this.addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final title = titleController.text;
    final amount = double.parse(amountController.text);
    if (title.isEmpty || amount <= 0) {
      return;
    }
    widget.addTransaction(
      title,
      amount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 50,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              // onChanged: (value) {
              //   titleInput = value;
              // },
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
              ),
            ),
            TextField(
              // onChanged: (value) {
              //   amountInput = value;
              // },
              keyboardType: TextInputType.number,
              controller: amountController,
              decoration: InputDecoration(
                labelText: 'Amount',
              ),
              onSubmitted: (_) => submitData(),
            ),
            FlatButton(
              onPressed: submitData,
              child: Text(
                'Add Transaction',
                style: TextStyle(
                  color: Colors.purple,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
