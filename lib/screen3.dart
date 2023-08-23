import 'package:flutter/material.dart';

class BettingTransaction {
  final String transactionId;
  final String category;
  final String amount;
  final String date;

  BettingTransaction({
    required this.transactionId,
    required this.category,
    required this.amount,
    required this.date,
  });
}

class BettingTransactionScreen extends StatelessWidget {
  final List<BettingTransaction> transactions = [
    BettingTransaction(
      transactionId: '1',
      category: 'Football',
      amount: '100',
      date: '2023-07-14',
    ),
    BettingTransaction(
      transactionId: '2',
      category: 'Basketball',
      amount: '50',
      date: '2023-07-13',
    ),
    BettingTransaction(
      transactionId: '3',
      category: 'Tennis',
      amount: '200',
      date: '2023-07-12',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Betting Transactions'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          final transaction = transactions[index];
          return ListTile(
            title: Text('Transaction ID: ${transaction.transactionId}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Category: ${transaction.category}'),
                Text('Amount: ${transaction.amount}'),
                Text('Date: ${transaction.date}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
