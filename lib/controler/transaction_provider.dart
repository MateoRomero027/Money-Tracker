import 'package:flutter/material.dart';
import 'package:moneytracker/model/transaction.dart';

class TransactionProvider extends ChangeNotifier{
  final List<Transaction> _transactions = [
    Transaction(
      type: TransactionType.income, 
      amount: 1000, 
      description: 'Salary',
      ),
      Transaction(
      type: TransactionType.expense, 
      amount: -500, 
      description: 'Rent',
      )
  ];

  List<Transaction> get transaction {
    return _transactions;
  }

  double getTotalIncomes () {
    return _transactions
      .where((transaction) => transaction.type == TransactionType.income)
      .map((transaction) => transaction.amount)
      .fold(0, (a, b) => a + b);
  }

  double getTotalExpenses () {
    return _transactions
      .where((transaction) => transaction.type == TransactionType.expense)
      .map((transaction) => transaction.amount)
      .fold(0, (a, b) => a + b);
  }

  double getBalance () {
    return getTotalIncomes() + getTotalExpenses(); 
  }
  
  // ignore: non_constant_identifier_names
  void AddTransaction(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }

}