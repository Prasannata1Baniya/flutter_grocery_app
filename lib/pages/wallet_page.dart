import 'package:flutter/material.dart';
import '../utils/text_styles.dart';

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
    Transaction(title: "Order Payment",
        amount: "-\$10.00",
        date: "Feb 25, 2025",
        isCredit: false),
    Transaction(title: "Added Funds",
        amount: "+\$30.00",
        date: "Feb 20, 2025",
        isCredit: true),
    Transaction(title: "Order Payment",
        amount: "-\$20.00",
        date: "Feb 15, 2025",
        isCredit: false),
  ];

  WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Cleaner base color
      appBar: AppBar(
        title: Text("Wallet", style: TextStyles.whiteTextFieldStyle()),
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back, color: Colors.white)),
      ),
      body: Column(
        children: [
          // 1. Premium Gradient Wallet Card
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.green.shade400, Colors.green.shade700],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(color: Colors.green.withValues(alpha: 0.3),
                    blurRadius: 15,
                    offset: const Offset(0, 8)),
              ],
            ),
            child: Column(
              children: [
                Text("Wallet Balance", style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.8), fontSize: 16)),
                const SizedBox(height: 10),
                Text(walletBalance, style: const TextStyle(color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold)),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.white,
                      foregroundColor: Colors.green),
                  icon: const Icon(Icons.add_circle_outline),
                  label: const Text("Add Funds"),
                  onPressed: () {},
                ),
              ],
            ),
          ),

          // 2. Styled Transaction List
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              itemCount: transactions.length,
              separatorBuilder: (context, index) => const Divider(height: 1),
              itemBuilder: (context, index) {
                final transaction = transactions[index];
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: transaction.isCredit
                            ? Colors.green.shade50
                            : Colors.red.shade50,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        transaction.isCredit ? Icons.arrow_downward : Icons
                            .arrow_upward,
                        color: transaction.isCredit ? Colors.green : Colors.red,
                      ),
                    ),
                    title: Text(transaction.title,
                        style: const TextStyle(fontWeight: FontWeight.w600)),
                    subtitle: Text(
                        transaction.date, style: const TextStyle(fontSize: 12)),
                    trailing: Text(transaction.amount,
                        style: TextStyle(
                            color: transaction.isCredit ? Colors.green : Colors
                                .black, fontWeight: FontWeight.bold)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

  /*@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("Wallet",style:  TextStyles.whiteTextFieldStyle(),),
        backgroundColor: Colors.green,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: const Icon(Icons.arrow_back,color: Colors.white,)
        ),
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
                Text("Wallet Balance", style: TextStyles.whiteTextFieldStyle()),
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
  }*/