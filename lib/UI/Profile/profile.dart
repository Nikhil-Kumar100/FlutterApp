import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:social_media_flutter/widgets/text.dart';
import 'package:techprohelpline/UI/shport/color.dart';
import 'package:techprohelpline/UI/shport/text.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appbar, // Set your desired background color
        elevation: 0,
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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      NetworkImage('https://via.placeholder.com/150'),
                ),
                SizedBox(height: 16),
                Text(
                  '${AppText.firstname} ${AppText.lastname}',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textColor),
                ),
                // Text('nikhil@example.com'),
                Profilename(),
                SizedBox(height: 24),
                ListTile(
                  leading:
                      Icon(Icons.settings, size: 20.0, color: AppColors.icon),
                  title: Text(
                    'Settings',
                    style: TextStyle(color: AppColors.textColor),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, "/setting");
                    // Navigate to settings screen
                  },
                ),

                ListTile(
                  leading: Icon(Icons.info, size: 20.0, color: AppColors.icon),
                  title: Text('About',
                      style: TextStyle(color: AppColors.textColor)),
                  onTap: () {
                    Navigator.pushNamed(context, "/about");
                    // Navigate to about screen
                  },
                ),
                ListTile(
                  leading: Icon(Icons.share, size: 20.0, color: AppColors.icon),
                  title: Text('Share',
                      style: TextStyle(color: AppColors.textColor)),
                  onTap: () {
                    _onShare(context);
                    // Navigate to about screen
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.reviews,
                      size: 20.0, color: AppColors.icon),
                  title: SocialWidget(
                    placeholderText: 'Review',
                    iconData: Icons.reviews,
                    link:
                        'https://www.youtube.com/channel/UCqwR5trO2ukalbrLYm7hwVQ',
                    iconColor: AppColors.icon,
                    iconSize: 0.0,
                    placeholderStyle:
                        TextStyle(color: AppColors.textColor, fontSize: 14),
                    // Adding a margin of 20 pixels
                  ),
                  textColor: AppColors.textColor,
                  dense: true,

                  // padding: EdgeInsets.zero,
                ),
                ListTile(
                  leading:
                      Icon(Icons.logout, size: 20.0, color: AppColors.icon),
                  title: Text('Logout',
                      style: TextStyle(color: AppColors.textColor)),
                  onTap: () {
                    Navigator.pushNamed(context, "/logout");
                    // Handle logout action
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//
///app  share code hai ==========================================================================

void _onShare(BuildContext context) async {
  final box = context.findRenderObject() as RenderBox?;

  await Share.share(
    'https://www.youtube.com/', // Replace with your actual text
    subject: 'Sharing Experience',
    sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
  );
}
//==================================================================================================