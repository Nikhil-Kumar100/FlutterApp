import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class AppText {
  static const String firstname = "Hello";
  static const String medelname = " ";
  static const String lastname = "User";
  static const String phonenumber = "+916201784889";
  static const String griting = "Hello";
  static const String homeappbartext = "Wellcome";
  static const String homepagequte = "Turning Ideas into Digital Reality";
  static const String homepagebutton = "Start Your Project contact now";
  // Service Headers
  static const String homePageServiceHeader = "Our Services";

  // Service Titles
  static const String webDevelopmentService = "Web Development";
  static const String androidAppDevelopmentService = "Android Development";
  static const String IosAppDevelopmentService = "Ios Development";
  static const String MacAppDevelopmentService = "Mac Development";
  static const String WindowsAppDevelopmentService = "Windows Development";
  static const String linuxAppDevelopmentService = "Linux Development";

  static const String uiUxDesignService = "UI/UX Design";
  static const String cybersecurityService = "Cybersecurity";
  static const String ethicalHackingService = "Ethical Hacking";
  static const String blueteamingService = "Blue Teaming";

  // Service Descriptions
  static const String webDevelopmentDescription =
      "Build beautiful and responsive websites.";
  static const String androidAppDevelopmentDescription =
      "Create stunning Android apps.";
  static const String IosAppDevelopmentDescription = "Coming soon.........";
  static const String MacAppDevelopmentDescription = "Coming soon.........";
  static const String WindowsAppDevelopmentDescription = "Coming soon.........";
  static const String linuxAppDevelopmentDescription = "Coming soon.........";

  static const String uiUxDesignDescription = "Coming soon.........";
  // "Craft intuitive user experiences.";
  static const String cybersecurityDescription =
      "Protect systems and data from cyber threats.";
  static const String ethicalHackingDescription =
      "Identify and fix security vulnerabilities.";

  static const String homepageReviewsbutton =
      "See Reviews and Write Your Experience";
  static const String blueteaming = "Coming soon.........";
}

//ye code user name accses ka hai
class Profilename extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<Profilename> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '${_user?.email ?? ''}',
          style: TextStyle(color: Colors.white, fontSize: 15),
        ),
        // Text('Display Name: ${_user?.displayName ?? ''}'),
      ],
    );
  }
}
