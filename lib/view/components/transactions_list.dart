import 'package:flutter/material.dart';
import 'package:moneytracker/controler/transaction_provider.dart';
import 'package:moneytracker/model/transaction.dart';
import 'package:provider/provider.dart';

class TransactionsList extends StatelessWidget {
  const TransactionsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final transaction = Provider.of<TransactionProvider>(context).transaction;
    return Expanded(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          ),
          child: ListView.builder(
            itemCount: transaction.length,
            itemBuilder: (contex, index) {
              final transactions = transaction[index];
              final type = transactions.type == TransactionType.income
                  ? 'Income'
                  : 'Expense';
                  final value = transactions.type == TransactionType.expense
                  ? '-\$ ${transactions.amount.abs().toStringAsFixed(2)}'
                  : '\$ ${transactions.amount.abs().toStringAsFixed(2)}';
                  final color = transactions.type == TransactionType.expense
                  ? Colors.red
                  : Colors.teal;

              return ListTile(
                title: Text(transactions.description),
                subtitle: Text(type),
                trailing: Text(value, style: TextStyle(fontSize: 14, color: color)),
              );
            }),
          ),
      );
  }
}