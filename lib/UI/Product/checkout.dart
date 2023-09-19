import 'package:flutter/material.dart';
import 'package:techprohelpline/UI/shport/color.dart';

class CheckoutScreen extends StatefulWidget {
  @override
  _CheckoutScreenState createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  List<CartItem> cartItems = [
    // Your initial cart items
  ];

  void _removeItem(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  void _addProduct() {
    setState(() {
      // Add a new product to the cartItems list
      cartItems.add(CartItem(
        productName: 'New Product',
        quantity: 1,
        price: 15,
      ));
    });
  }

  double getTotalAmount() {
    return cartItems.fold(0, (sum, item) => sum + (item.quantity * item.price));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbar,
        elevation: 0,
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
        child: ListView.builder(
          itemCount: cartItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(cartItems[index].productName),
              subtitle: Text('Quantity: ${cartItems[index].quantity}'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '\$${cartItems[index].quantity * cartItems[index].price}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      _removeItem(index);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: AppColors.button,
                    ),
                    child: Text('Remove'),
                  ),
                ],
              ),
            );
          },
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.secondaryColor,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total Amount: \$${getTotalAmount().toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              ElevatedButton(
                onPressed: () {
                  // Handle checkout action
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColors.button,
                ),
                child: Text('Checkout'),
              ),
            ],
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _addProduct,
      //   child: Icon(Icons.add),
      // ),
    );
  }
}

class CartItem {
  final String productName;
  final int quantity;
  final double price;

  CartItem({
    required this.productName,
    required this.quantity,
    required this.price,
  });
}
