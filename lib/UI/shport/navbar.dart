import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:techprohelpline/UI/drawer/drawer.dart';
import 'package:techprohelpline/UI/shport/color.dart';
import 'package:techprohelpline/UI/Chat/chat.dart';
import 'package:techprohelpline/UI/Product/checkout.dart';
import 'package:techprohelpline/UI/Profile/profile.dart';
import 'package:techprohelpline/UI/Product/product.dart';

class Navbar extends StatefulWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _currentIndex = 0; // Index to track the selected button
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: AppColors.appbar,
        index: _currentIndex,
        height: 50,
        items: <Widget>[
          Icon(Icons.home, size: 30),
          Icon(Icons.chat, size: 30),
          Icon(Icons.design_services, size: 30),
          Icon(Icons.shopping_cart, size: 30),
          Icon(Icons.person, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected button index
          });
        },
      ),
      body: Container(
        color: Colors.blueAccent,
        child: Center(
          child: AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            child: _buildSelectedScreen(_currentIndex),
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedScreen(int index) {
    switch (index) {
      case 0:
        return Center(child: DrawerScreen());
      case 1:
        return Center(child: ChatPage());

      case 2:
        return Center(child: OurserviceScnre());
      case 3:
        return Center(child: CheckoutScreen());
      case 4:
        return Center(child: ProfileScreen());
      default:
        return Center(child: Text("Invalid Screen"));
    }
  }
}
