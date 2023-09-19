import 'package:flutter/material.dart';
import 'package:techprohelpline/UI/shport/color.dart';

// ignore: must_be_immutable
class WalletScreen extends StatelessWidget {
  double balance = 15000000.35;

  WalletScreen({super.key}); // Demo balance, you can change it as needed

  void addBalance() {
    // Add logic to increase the wallet balance
    balance += 50.0; // Example: Adding $50R
  }

  void pay() {
    // Add logic to perform payment
    if (balance >= 50.0) {
      balance -= 50.0; // Deduct $50 for payment
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.appbar,
        title: Text('Wallet'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryColor,
              AppColors.secondaryColor,
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Your Wallet Balance',
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(height: 20),
              Text(
                '\$${balance.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: addBalance,
                child: Text('Add Balance (+\$50)'),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: pay,
                child: Text('Pay (-\$50)'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
