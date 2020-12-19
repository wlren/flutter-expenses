import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import './chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);

  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;
      for (var i = 0; i < recentTransactions.length; i++) {
        if (recentTransactions[i].date.day == weekDay.day &&
            recentTransactions[i].date.month == weekDay.month &&
            recentTransactions[i].date.year == weekDay.year) {
          totalSum += recentTransactions[i].amount;
        }
      }

      return {
        'Day': DateFormat.E().format(weekDay).substring(0, 3),
        'amount': totalSum
      };
    });
  }

  double get maxSpendings {
    return groupedTransactionsValues.fold(
        0.0, (sum, item) => sum + item['amount']);
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionsValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionsValues.map((data) {
          return ChartBar(
              data['Day'],
              data['amount'],
              maxSpendings == 0.0
                  ? 0.0
                  : (data['amount'] as double) / maxSpendings);
        }).toList(),
      ),
    );
  }
}
