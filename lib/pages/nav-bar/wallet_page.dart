import 'package:flutter/material.dart';

import '../../service/service.dart';

class Transaction {
  final String title;
  final String amount;
  final String date;
  final bool isCredit; // True for added funds, False for spending

  Transaction({required this.title, required this.amount, required this.date, required this.isCredit});
}

class WalletPage extends StatelessWidget {
  final String walletBalance = "\$50.00";

  final List<Transaction> transactions = [
    Transaction(title: "Order Payment", amount: "-\$10.00", date: "Feb 25, 2025", isCredit: false),
    Transaction(title: "Added Funds", amount: "+\$30.00", date: "Feb 20, 2025", isCredit: true),
    Transaction(title: "Order Payment", amount: "-\$20.00", date: "Feb 15, 2025", isCredit: false),
  ];

  WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Wallet",style: AppWidget.whiteTextfieldStyle(),),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          // Wallet Balance
          Container(
            margin: const EdgeInsets.all(16),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                Text("Wallet Balance", style: AppWidget.whiteSmallTextfieldStyle()),
                const SizedBox(height: 5),
                Text(walletBalance, style: const TextStyle(color: Colors.green, fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                ElevatedButton.icon(
                  icon: const Icon(Icons.add),
                  label: const Text("Add Funds"),
                  onPressed: () {
                    // Add funds logic here
                  },
                ),
              ],
            ),
          ),

          // Transactions List
          Expanded(
            child: ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return ListTile(
                  leading: Icon(transaction.isCredit ? Icons.arrow_downward : Icons.arrow_upward,
                      color: transaction.isCredit ? Colors.green : Colors.red),
                  title: Text(transaction.title),
                  subtitle: Text(transaction.date),
                  trailing: Text(transaction.amount, style: TextStyle(color: transaction.isCredit ? Colors.green : Colors.red)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
