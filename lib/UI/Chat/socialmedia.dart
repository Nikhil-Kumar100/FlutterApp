import 'package:flutter/material.dart';
import 'package:social_media_flutter/widgets/icons.dart';
import 'package:social_media_flutter/widgets/text.dart';
import 'package:techprohelpline/UI/shport/color.dart';
import 'package:techprohelpline/UI/shport/text.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialMedia extends StatelessWidget {
  const SocialMedia({Key? key}) : super(key: key);

  get instagramUrl => null;
  //yeh code call fungtion ka hai==================================================
  void _initiatePhoneCall(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunch(phoneUri.toString())) {
      await launch(phoneUri.toString());
    } else {
      print('Cannot initiate phone call');
    }
  }

// ====================================================================================
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          // color: Color.fromARGB(255, 254, 254, 254)
          //     .withOpacity(0.1), // Set the background color

          // Set border radius
          ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.phone, // Set desired icon
                size: 30, // Set desired icon size
              ),
              onPressed: () {
                _initiatePhoneCall(
                    '+916201784889'); // Replace with desired phone number
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20),
              ),
              onPressed: () {
                _initiatePhoneCall(
                    '${AppText.phonenumber}'); // Replace with desired phone number
              },
              child: const Text(
                'Call Now',
                style: TextStyle(color: AppColors.textColor),
              ),
            ),
            SocialWidget(
              placeholderText: 'YouTube',
              iconData: SocialIconsFlutter.youtube,
              link: 'https://www.youtube.com/channel/UCqwR5trO2ukalbrLYm7hwVQ',
              iconColor: Colors.red,
              placeholderStyle:
                  TextStyle(color: AppColors.textColor, fontSize: 20),
            ),
            SocialWidget(
              placeholderText: 'Instagram',
              iconData: SocialIconsFlutter.instagram,
              iconColor: Colors.pink,
              link: 'https://www.instagram.com/techprohelpline/',
              placeholderStyle:
                  TextStyle(color: AppColors.textColor, fontSize: 20),
            ),
            SocialWidget(
              placeholderText: 'GitHub',
              iconData: SocialIconsFlutter.github,
              link: 'https://github.com/Nikhil-Kumar100',
              iconColor: Colors.black,
              placeholderStyle:
                  TextStyle(color: AppColors.textColor, fontSize: 20),
            ),
            SocialWidget(
              placeholderText: 'Linkdin',
              iconData: SocialIconsFlutter.linkedin,
              iconColor: Colors.lightBlue,
              link: 'https://www.linkedin.com/in/nikhil-kumar-220715188/',
              placeholderStyle:
                  TextStyle(color: AppColors.textColor, fontSize: 20),
            ),
            SocialWidget(
              placeholderText: 'Facebook',
              iconData: SocialIconsFlutter.facebook,
              link: 'https://www.facebook.com/Techprohelpline',
              iconColor: Colors.blue,
              placeholderStyle:
                  TextStyle(color: AppColors.textColor, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
//ye vala slide code hai=================================================================
