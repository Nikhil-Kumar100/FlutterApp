import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:techprohelpline/UI/Chat/adminchatpage.dart';
import 'package:techprohelpline/UI/Login/login.dart';
import 'package:techprohelpline/UI/Profile/about.dart';
import 'package:techprohelpline/UI/Login/logout.dart';
import 'package:techprohelpline/UI/Profile/editProfile.dart';
import 'package:techprohelpline/UI/Profile/profile.dart';
import 'package:techprohelpline/UI/Profile/setting.dart';
import 'package:techprohelpline/UI/drawer/drawer.dart';
import 'package:techprohelpline/UI/drawer/wallet.dart';
import 'package:techprohelpline/UI/Chat/chat.dart';
import 'package:techprohelpline/UI/Product/checkout.dart';
import 'package:techprohelpline/UI/drawer/favorites.dart';
import 'package:techprohelpline/UI/Loding/loding.dart';
import 'package:techprohelpline/UI/shport/navbar.dart';
import 'package:techprohelpline/UI/drawer/review.dart';
import 'package:techprohelpline/UI/Chat/socialmedia.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:techprohelpline/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      routes: {
        "/loding": (context) => LoadingPage(),
        "/home": (context) => const Navbar(),
        "/setting": (context) => AppSettingsPage(),
        "/about": (context) => AboutScreen(),
        "/logout": (context) => LogoutPage(context),
        "/chat": (context) => ChatPage(),
        '/drawer': (context) => DrawerScreen(),
        "/profile": (context) => ProfileScreen(),
        "/checkout": (context) => CheckoutScreen(),
        "/Favorites": (context) => FavoritesScreen(),
        '/wallet': (context) => WalletScreen(),
        "/Review": (context) => ReviewCard(),
        "/socialmedia": (context) => const SocialMedia(),
        "/login": (context) => LoginScreen(),
        "/reply": (context) => AdminChatPage(),
        "/editprofile": (context) => EditProfile(),

        // "/ProductDetailScreen": (context) => ProductDetailScreen(),
      },
      initialRoute: "/loding", // Start with the loading page
    );
  }
}
