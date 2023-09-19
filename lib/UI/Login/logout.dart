import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:techprohelpline/UI/Login/login.dart';
import 'package:techprohelpline/UI/shport/color.dart';

class LogoutPage extends StatelessWidget {
  final BuildContext context; // Pass the context to the constructor

  LogoutPage(this.context);

  Future<bool> logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.popUntil(context, (route) => route.isFirst);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
      return true; // Logout was successful
    } catch (e) {
      print('Error during logout: $e');
      return false; // Logout encountered an error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Logout'),
        backgroundColor: AppColors.appbar,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                print("Logout button pressed");
                logOut().then((result) {
                  print("Logout result: $result");
                  if (result) {
                    print("Logged out successfully");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Logged out successfully')),
                    );
                  } else {
                    print("Error logging out");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error logging out')),
                    );
                  }
                });
              },
              icon: Icon(
                Icons.logout,
                color: AppColors.textColor,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
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
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {
                    print("Logout button pressed");
                    logOut().then((result) {
                      print("Logout result: $result");
                      if (result) {
                        print("Logged out successfully");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Logged out successfully')),
                        );
                      } else {
                        print("Error logging out");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Error logging out')),
                        );
                      }
                    });
                  },
                  child: Text(
                    'Are you sure you want to logout?',
                    style: TextStyle(fontSize: 20, color: AppColors.textColor),
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
