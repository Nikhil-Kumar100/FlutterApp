import 'package:flutter/material.dart';
import 'package:techprohelpline/UI/shport/color.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbar,
        elevation: 0,
        title: Text('About Us'),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primaryColor,
              AppColors.secondaryColor,
            ],
          ),
        ),
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Welcome to TechProHelpline!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'About Us',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'TechProHelpline is your one-stop destination for tech support and solutions. We are dedicated to providing you with the best possible assistance for all your technical queries and problems.',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Contact Us',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'For any inquiries or assistance, feel free to contact us at:',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColors.textColor,
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Handle contact action, e.g., opening email or phone
                },
                child: Text(
                  'support@techprohelpline.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.linkcolor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Handle contact action, e.g., opening email or phone
                },
                child: Text(
                  '+1 (123) 456-7890',
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.linkcolor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
